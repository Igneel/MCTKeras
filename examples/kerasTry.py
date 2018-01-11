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

class printbatch(callbacks.Callback):
    def on_epoch_begin(self, epoch, logs={}):
        print(logs)
    def on_epoch_end(self, epoch, logs={}):
        print(logs)


nb_epoch = 1


# the x train data is criterias
# the y train data is the correct value of error
# we try to predict error

# we have to read file by parts

#def loadData:
	#with open("log.txt") as infile:
	#    for line in infile:
	 #       do_something_with(line)

	#	x = np.array([[1, 2, 3], [4, 5, 6]], np.int32)
	#>>> type(x)
	#<type 'numpy.ndarray'>
	#>>> x.shape
	#(2, 3)
	#>>> x.dtype
	#dtype('int32')

blocksize=32
trainsetLenght = 2000

def myGenerator():
    #(X_train, y_train) = loadData() # need to be fixed 
    #y_train = np_utils.to_categorical(y_train,10)
    #X_train = X_train.reshape(X_train.shape[0], 1, 28, 28)
    X_train=np.array([list(range(64000)),list(range(64000)),list(range(64000))])
    X_train = np.transpose(X_train)    
    #print(X_train[0][:])
    y_train=np.array(list(map((lambda x: x[0]+2*x[1]+3*x[2]), X_train)))
    #print(y_train)
    X_train = X_train.astype('float64') # maybe you are exist:)
    #X_train = X_train.reshape(32000,2)
    while 1:
        for i in range(0,trainsetLenght):
            #print(X_train[i])
            #print(X_train[i*blocksize:(i+1)*blocksize][:], y_train[i*blocksize:(i+1)*blocksize])
            yield X_train[i*blocksize:(i+1)*blocksize][:], y_train[i*blocksize:(i+1)*blocksize]

model = Sequential()
model.add(Dense(units=3, input_shape=(3,)))

model.add(Dense(units=6))

model.add(Dense(units=1))
#model.add(Activation('relu'))
#model.add(Activation('softmax'))

model.compile(optimizer='rmsprop',
              loss='mse')

pb = printbatch()
my_generator = myGenerator()

print("Built the generator")

t0=time.time()
#model.fit(X_train, y_train, epochs=5, batch_size=32)
model.fit_generator(my_generator, epochs=nb_epoch, workers=1, steps_per_epoch=50000, callbacks=[pb], validation_data=None, verbose=2, class_weight=None)
t1=time.time()



print("Training completed in " + str(t1-t0) + " seconds")
print("Training completed in " + str((t1-t0)/3600.) + " hours")

classes = model.predict([[4,1,0],[64,128,4]], batch_size=128)

print(classes)