# -*- coding: UTF-8 -*-
# So, let's try

import time
import logging
from keras.models import Sequential
from keras.layers.core import Dense, Dropout, Activation, Flatten, Reshape
from keras.layers.recurrent import LSTM
from keras.layers.normalization import BatchNormalization
#from keras.layers.convolutional import Convolution1D, Convolution2D, MaxPooling2D
from keras.utils import np_utils
from keras.layers import Conv1D, GlobalMaxPooling1D
from keras import callbacks
import numpy as np
import h5py

class printbatch(callbacks.Callback):
    def on_epoch_begin(self, epoch, logs={}):
        print(logs)
    def on_epoch_end(self, epoch, logs={}):
        print(logs)
    def on_batch_begin(self, batch, logs={}):
        print(logs)
    def on_batch_end(self, batch, logs={}):
        print(logs)


# the x train data is criterias
# the y train data is the correct value of error
# we try to predict error

inputVectorLength = 6005 # Это тоже лучше читать из файла.
batch_size=100 # Размер обрабатываемой за один раз выборки


def read_training_data(file):
    with h5py.File(file, 'r') as hf:
        data = np.array(hf.get('data'))
        label = np.array(hf.get('label'))
    return data, label


filters = 4096
kernel_size = 3

model = Sequential()

model.add(Dense(units=6000, input_shape=(inputVectorLength,)))
#model.add(BatchNormalization())
model.add(Reshape((6000,) + (1, )))
model.add(Conv1D(filters, kernel_size, padding='same', activation='relu',strides=1))
model.add(GlobalMaxPooling1D())
#model.add(Dense(units=4096))
#model.add(Dense(units=1024))
#model.add(Dense(units=256))
#model.add(Dense(units=64))
#model.add(Dense(units=16))
model.add(Dense(units=3))
#model.add(Activation('relu'))
model.add(Activation('softmax'))

model.compile(optimizer='nadam',                # rmsprop
              loss='mean_squared_logarithmic_error')

pb = printbatch()

print("Built the generator")

nb_epoch = 100

data, label = read_training_data("tiny_train_set.h5")
val_data, val_label = read_training_data("tiny_val_set.h5")

#print(val_data)
#print(val_label)

t0=time.time()
#model.fit(X_train, y_train, epochs=5, batch_size=32)
model.fit(data, label, epochs=nb_epoch, callbacks=[pb], validation_data=(val_data, val_label), verbose=2,batch_size=batch_size)
#model.fit_generator(my_generator, epochs=nb_epoch)
t1=time.time()

model.save("./obtained_keras_model.h5")


print("Training completed in " + str(t1-t0) + " seconds")
print("Training completed in " + str((t1-t0)/3600.) + " hours")
print("Training completed in " + str((t1-t0)/3600./24.) + " days")

#classes = model.predict(np.array([[77,[[0.0,0.5,1,1.5,2.0];[0.0,0.5,1,1.5,2.0];[0.0,0.5,1,1.5,2.0]]]]), batch_size=128)

#print(classes)
