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

# Это текущая версия по подготовке данных
"""
Итак, что нам надо:

1. Запускать приложение
2. Ждать пока оно отработает
3. Как-то получать от него данные (файл - медленно, но как по-другому-то?)
4. Добавлять данные в массив
5. Остановиться в какой-то момент, пока комп ещё может это обрабатывать
6. Сохранить данные в виде h5 файла.
7. Радоваться жизни?

"""

"""
Есть важное замечание по поводу нормирования.
Придется жестко задать максимально возможные значения всех параметров и нормировать на них.
Само-собой взять их нереально высокими и тогда будет норм.


"""

"""
Первый вариант сети будет самым тупым

На вход подаётся исходная информация, на выходе ждем от сети концентрацию и подвижность носителей.

В теории, если такой подход оправдает себя - можно будет обучить сеть определять количество типов носителей (включить в обучающую выборку такие примеры)
Тем самым границы применимости сети будут существенно расширены.

Надо будет только уточнить у Димы эти моменты.



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

"""


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

def parseMobSpec(outs):
    outs= outs.split("\n")[1:]
    outs=list(map(lambda o: o.split("\t")[:-1], outs))
    outs=list(map(lambda o: list(map(lambda o2: float(o2),o)),outs))
    #print(len(outs))

    loadedData=outs[0]
    resData = outs[2]

    return loadedData,resData



def prepare_training_data(quantity):
    print("prepare_training_data")

    inputVectorLength = 49980
    
    loadedData = np.ones([quantity,inputVectorLength])

    resData = np.ones([quantity,6])
    
    for b in range(0,quantity):
        t= randint(77, 300)
        print(b)
        # ./main T kNoise current sampleLength sampleWidth sampleThickness eHeavyHoleConcentration molarCadmium electronMobility
        # ./main 77 1 10e-3 30e-3 10e-3 1e-5 1e22 0.21
        # Так как параметры зависят от отношения длины образца к его ширине, то ширину можно не менять, а менять только длину.

        # Нужно рандомизировать

        kNoise = randint(0,5)
        current = 10e-3+uniform(0,10e-3)
        sampleLength = 30e-3+uniform(0,50e-3)
        sampleWidth = sampleLength/uniform(0,5)
        sampleThickness = 1e-5+uniform(0,5e-5)
        eHeavyHoleConcentration = 1e22+uniform(-5e21,5e21)
        molarCadmium = 0.21+uniform(-0.1,0.3)
        AFactor = 5+uniform(0,3)
        KFactor = 1.3+uniform(0,0.2)
        
        #77 1 10e-3 30e-3 10e-3 1e-5 1e22 0.21 5 1.3
        #proc=subprocess.run(["./MCTConsole", str(77), str(0),str(10e-3), str(30e-3), str(10e-3), str(1e-5), str(1e22),str(0.21), str(5), str(1.3)], stdout=subprocess.PIPE)

        proc=subprocess.run(["./MCTConsole", str(t), str(kNoise),str(current), str(sampleLength), str(sampleWidth), str(sampleThickness), str(eHeavyHoleConcentration),str(molarCadmium), str(AFactor), str(KFactor)], stdout=subprocess.PIPE)
        outs, err= proc.stdout, proc.stderr

        outs = outs.decode("UTF-8")

        outs= outs.split("NewSectionBeginHere")[1:]

        #resTensor = parseTensor(outs[0])
        #resCriteria = parseCriteria(outs[1])
        #resMobSpec = parseMobSpec(outs[2])

        loadedData[b,:], resData[b,:] = parseMobSpec(outs[2])

        if np.nan in loadedData[b,:] or np.nan in resData[b,:]:
            b=b-1
    
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
    # Насчёт количества
    # (301-77)*(5)*((5-2)/0.1)*50*1000*10*10
    # Полное покрытие будет 160 800 000 000 штук

    # Допустим я софрмирую 1 000 000 000 образцов для обучения и
    # 10 000 000 для validation set
    # 1 000 000 - для контрольной выборки

    #print("generating train_set")
    #data, label = prepare_training_data(100000)
    # data - input
    # label - output
    #write_hdf5(data, label, "train_set.h5")
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
    data, label = prepare_training_data(50)
    #print(data)
    #print(label)
    write_hdf5(data,label,"dev_MobSpec_train_set.h5")
    #data, label = prepare_training_data(1000)
    #write_hdf5(data,label,"tiny_val_set.h5")
    #print(label)


    
