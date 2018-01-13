# -*- coding: UTF-8 -*-
# So, let's try

import time
import logging
from keras.models import Sequential
from keras.layers.core import Dense, Dropout, Activation, Flatten
from keras.layers.recurrent import LSTM
#from keras.layers.convolutional import Convolution1D, Convolution2D, MaxPooling2D
from keras.utils import np_utils
from keras import callbacks
import numpy as np
import subprocess

class printbatch(callbacks.Callback):
    def on_epoch_begin(self, epoch, logs={}):
        print(logs)
    def on_epoch_end(self, epoch, logs={}):
        print(logs)


# the x train data is criterias
# the y train data is the correct value of error
# we try to predict error

inputVectorLength = 100 # Это тоже лучше читать из файла.
batch_size=32 # Размер обрабатываемой за один раз выборки

# По входным данным предлагают вот что:
# первой строкой сила тока, отношение длины к ширине, толщина
# далее - магнитная индукция, напряжение магнитносопротивления, напряжение холла
# температура идёт третьим измерением (т.к. такой тензор получаем)
#
#        3 - три столбца
#        ______________________
#       /| I  CBRatio Thickness|
#      / | B1 Us1     Uy1      |
#     /  | ....................|
#    /T  | Bn Usn     Uyn      |

# Я тут смотрю на это - и не понимаю, зачем такая сложность?
# Можно же просто сделать вот так?

#    ________________________
#    | T  T        T        |
#    | I  CBRation Thickness|
#    | B1 Us1     Uy1       |
#    | .....................|
#    | Bn Usn     Uyn       |
#    ________________________

# v1
# Да и в целом - а надо ли мне иметь двумерную структуру?
# Данные сами-по себе может и зависят, но если будет вектор - то всё равно ж сеть разберётся что к чему....
# А мне на выходе только числа нужны...
#   _______________________________________________________       ______________________
#   |T I CBRation Thickness B1 .. Bn Us1 .. Usn Uy1 .. Uyn|  ---> |n1 mu1 n2 mu2 n3 mu3|
#   _______________________________________________________       ______________________ 


# v2
#  ___________________________________         ___________________________
#  |Критерий1 Критерий2 ... КритерийN|  --->   |Относительная погрешность|
#

# v3
#                               ______________________
#  |Спектр подвижности|   --->  |n1 mu1 n2 mu2 n3 mu3|
#                               ______________________
#

loadedData = np.zeros([batch_size,inputVectorLength])

resData = np.zeros([batch_size,6])
#test = np.zeros([batch_size,temperature,inputVectorLength,3])

for b in range(0,batch_size):
    for t in range(77,301):
        # ./main T kNoise current sampleLength sampleWidth sampleThickness eHeavyHoleConcentration
        # ./main 77 1 10e-3 30e-3 10e-3 1e-5 1e22 0.21
        # Так как параметры зависят от отношения длины образца к его ширине, то ширину можно не менять, а менять только длину.

        proc=subprocess.run(["./MCTConsole", str(t), str(1), str(sampleLength), str(sampleWidth), str(sampleThickness, str(eHeavyHoleConcentration))], stdout=subprocess.PIPE)
        outs, errs = proc.communicate()

        # let's suppose that MCTConsike saves output data into "input.txt" (I, Cbration, Thickness, B, Us,Uy) and "output.txt" (mu1 n1, mu2 n2, mu3 n3)
        inDataFile = open("input.txt",'r')
        temp = inDataFile.read()
        temp = temp.split('\n')
        # here the temp[n] is "0.5 43.3234 2.34545"
        for i in range(0,len(temp)):
            loadedData[b,t-77,i]=t.split(" ") # or \t - we should check this

        outDataFile = open("output.txt",'r')
        temp = outDataFile.read()
        temp = temp.split('\n')

        for i in range(0,len(temp)):
            resData[b,t-77,i]=t.split(" ") # or \t - we should check this


        


temp = np.array([[0.0,0.5,1,1.5,2.0],[0.0,0.5,1,1.5,2.0],[0.0,0.5,1,1.5,2.0]])
test[0][0]=temp.transpose()

print(test.shape)

def myGenerator():
    fname='input.txt'
    dt = np.dtype([float,float,float,float])
    np.fromfile(fname,dt,-1,'\t')

    X_train=np.ones([batch_size,temperature,inputVectorLength,3])
    
    #y_train=np.array(list(map((lambda x: x[0]+2*x[1]+3*x[2]), X_train)))
    y_train=np.ones([batch_size,temperature,inputVectorLength,3])
    
    print(X_train.shape)
    print(y_train.shape)
    
    while 1:
        yield (X_train, y_train)



model = Sequential()

model.add(Dense(units=4096, input_shape=(inputVectorLength)))
model.add(Dense(units=1024))
model.add(Dense(units=256))
model.add(Dense(units=64))
model.add(Dense(units=16))
model.add(Dense(units=6))
#model.add(Activation('relu'))
#model.add(Activation('softmax'))

model.compile(optimizer='rmsprop',
              loss='mse')

pb = printbatch()
my_generator = myGenerator()

print("Built the generator")

nb_epoch = 2

t0=time.time()
#model.fit(X_train, y_train, epochs=5, batch_size=32)
model.fit_generator(my_generator, steps_per_epoch=2, epochs=nb_epoch, callbacks=[pb], validation_data=None, verbose=2)
#model.fit_generator(my_generator, epochs=nb_epoch)
t1=time.time()



print("Training completed in " + str(t1-t0) + " seconds")
print("Training completed in " + str((t1-t0)/3600.) + " hours")
print("Training completed in " + str((t1-t0)/3600./24.) + " days")

#classes = model.predict(np.array([[77,[[0.0,0.5,1,1.5,2.0];[0.0,0.5,1,1.5,2.0];[0.0,0.5,1,1.5,2.0]]]]), batch_size=128)

#print(classes)