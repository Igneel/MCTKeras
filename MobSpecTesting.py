# -*- coding: UTF-8 -*-

import h5py
import subprocess
from random import *
import numpy as np

DATA_PATH = "./DataSet/"
Random_Crop = 100
Patch_size = 50
label_size = 100
scale = 2


def parseTensor(outs):
    outs= outs.split("\n")[1:]

    outs=list(map(lambda o: o.split("\t")[:-1], outs))
    outs=list(map(lambda o: list(map(lambda o2: float(o2),o)),outs))
    #print(len(outs))


def parseCriteria(outs):
    outs= outs.split("\n")[1:-1]
    

    outs=list(map(lambda o: o.split("\t")[:-1], outs))
    outs=list(map(lambda o: list(map(lambda o2: float(o2),o)),outs))
    #print(outs)

    outs[2][4]=-1*outs[2][4]
    outs[2][5]=-1*outs[2][5]

    loadedData=outs[0]

    #print(outs[1])

    #print(outs[2])

    # относительная погрешность:
    # (значение-истинное значение)/истинное значение * 100%
    # outs[1] - экспериментальные значения
    # outs[2] - истинные значения

    resData = outs[1]
    print(resData)

    for i in range(0, len(outs[1])):
        err = abs((abs(resData[i])-abs(outs[2][i]))/outs[2][i]*100)
        print('exp val: '+str(abs(resData[i])))
        print('true val: '+str(abs(outs[2][i])))
        print('err'+str(err))
        if err<100:
            resData[i]=err
        else:
            resData[i]=100

    #print(len(loadedData))

    

    return loadedData, resData

def parseMobSpec(outs):
    outs= outs.split("\n")[1:]
    outs=list(map(lambda o: o.split("\t")[:-1], outs))
    outs=list(map(lambda o: list(map(lambda o2: float(o2),o)),outs))
    #print(len(outs))

    loadedData=outs[0]
    resData = outs[2]

    #print(outs[0][0])
    #print(outs[0][-1])

    #print(outs[1])
    #print(outs[2])

    return loadedData,resData

def prepare_training_data(quantity,kNoiseTempCoef):
    print("prepare_training_data")

    inputVectorLength =59976 # 116

    filtNumKoef = 1 #21 # 2600 # (200-150)//10*(200-150)//10*(50-1)//5*(50-1)//5
    
    loadedData = np.ones([quantity*filtNumKoef,inputVectorLength])

    resData = np.ones([quantity*filtNumKoef,6])
    
    for b in range(0,quantity):
        print("tick")
        t= randint(77, 300)
        print(b)
        # ./main T kNoise current sampleLength sampleWidth sampleThickness eHeavyHoleConcentration molarCadmium electronMobility
        # ./main 77 1 10e-3 30e-3 10e-3 1e-5 1e22 0.21
        # Так как параметры зависят от отношения длины образца к его ширине, то ширину можно не менять, а менять только длину.

        # Нужно рандомизировать

        #kNoise = randint(0,5)
        current = 10e-3+uniform(0,10e-3)
        sampleLength = 30e-3+uniform(0,50e-3)
        sampleWidth = sampleLength/uniform(0,5)
        sampleThickness = 1e-5+uniform(0,5e-5)
        eHeavyHoleConcentration = 1e22+uniform(-5e21,5e21)
        molarCadmium = 0.21+uniform(-0.1,0.3)
        AFactor = 5+uniform(0,3)
        KFactor = 1.3+uniform(0,0.2)

        eSamplingFRes=100
        eBandWidthFRes=10
        eAttenuationFRes=20
        eLengthFilterRes=50

        eSamplingFHall=100
        eBandWidthFHall=10
        eAttenuationFHall=20
        eLengthFilterHall=50

        NumberOfDecimalPlaces = 5
        

        #77 1 10e-3 30e-3 10e-3 1e-5 1e22 0.21 5 1.3 100 10 20 50 100 10 20 50 5
        #proc=subprocess.run(["./MCTConsole", str(77), str(0),str(10e-3), str(30e-3), str(10e-3), str(1e-5), str(1e22),str(0.21), str(5), str(1.3), str(100), str(10), str(20), str(50), str(100), str(10), str(20), str(50), str(5)], stdout=subprocess.PIPE)
        #proc=subprocess.run(["./MCTConsole", str(77), str(kNoiseTempCoef),str(10e-3), str(30e-3), str(10e-3), str(1e-5), str(1e22),str(0.21), str(5), str(1.3), str(eSamplingFRes), str(eBandWidthFRes), str(eAttenuationFRes), str(eLengthFilterRes), str(eSamplingFHall), str(eBandWidthFHall), str(eAttenuationFHall), str(eLengthFilterHall), str(NumberOfDecimalPlaces)], stdout=subprocess.PIPE)
        proc=subprocess.run(["./MCTConsole", str(77), str(0),str(10e-3), str(30e-3), str(10e-3), str(1e-5), str(1e22),str(0.21), str(5), str(1.3), str(eSamplingFRes), str(eBandWidthFRes), str(eAttenuationFRes), str(eLengthFilterRes), str(eSamplingFHall), str(eBandWidthFHall), str(eAttenuationFHall), str(eLengthFilterHall), str(NumberOfDecimalPlaces)], stdout=subprocess.PIPE)
        #proc=subprocess.run(["./MCTConsole", str(t), str(kNoise),str(current), str(sampleLength), str(sampleWidth), str(sampleThickness), str(eHeavyHoleConcentration),str(molarCadmium), str(AFactor), str(KFactor), str(eSamplingFRes), str(eBandWidthFRes), str(eAttenuationFRes), str(eLengthFilterRes), str(eSamplingFHall), str(eBandWidthFHall), str(eAttenuationFHall), str(eLengthFilterHall), str(NumberOfDecimalPlaces)], stdout=subprocess.PIPE)
        outs, err= proc.stdout, proc.stderr

        outs = outs.decode("UTF-8")

        outs= outs.split("NewSectionBeginHere")[1:]

        parseCriteria(outs[1])

        #loadedData[b,:], resData[b,:] = parseTensor(outs[0])
        #loadedData[b,:], resData[b,:] = parseCriteria(outs[1])
        loadedData[b,:], resData[b,:] = parseMobSpec(outs[2])


        if np.nan in loadedData[b,:] or np.nan in resData[b,:]:
            b=b-1
        else:
            b=b+1
        print(b)

    
    return loadedData, resData

def write_hdf5(data, labels, output_filename):
    print("write_hdf5")
    """
    This function is used to save image data and its label(s) to hdf5 file.
    output_file contains data and label
    """
    x = data.astype(np.float32)
    y = labels.astype(np.float32)

    with h5py.File(output_filename, 'w') as h:
        h.create_dataset('data', data=x, shape=x.shape)
        h.create_dataset('label', data=y, shape=y.shape)


def gen_data():
    
    data=[]
    label=[]
    print("generating short validation_set")
    data, label = prepare_training_data(100000)
    write_hdf5(data, label, "validation_set.h5")
    data=[]
    label=[]
    print("generating check_set")
    data, label = prepare_training_data(100000)
    write_hdf5(data, label, "check_set.h5")

if __name__ == "__main__":
    #gen_data()
    data, label = prepare_training_data(1,0.0)
    write_hdf5(data,label,"MobSpecTest.h5")
    data=[]
    label=[]

    
    #print(data)
    #print(label)
