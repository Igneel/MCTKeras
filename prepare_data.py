import h5py
from pwn import *
from random import *

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


def prepare_training_data(quantity):
    print("prepare_training_data")

    inputVectorLength = 4096
    
    loadedData = np.zeros([quantity,inputVectorLength])

    resData = np.zeros([quantity,6])
    
    for b in range(0,quantity):
        t= randint(77, 300)
        # ./main T kNoise current sampleLength sampleWidth sampleThickness eHeavyHoleConcentration molarCadmium electronMobility
        # ./main 77 1 10e-3 30e-3 10e-3 1e-5 1e22 0.21
        # Так как параметры зависят от отношения длины образца к его ширине, то ширину можно не менять, а менять только длину.

        # Нужно рандомизировать

        kNoise = randint(0,5)
        sampleLength = 30e-3+uniform(0,50e-3)
        sampleWidth = sampleLength/uniform(0,5)
        sampleThickness = 1e-5+uniform(0,5e-5)
        eHeavyHoleConcentration = 1e22+uniform(-5e21,5e21)
        molarCadmium = 0.21+uniform(-0.1,0.3)
        electronMobility = 5+uniform(-4,4)


        proc=subprocess.run(["./MCTConsole", str(t), str(kNoise), str(sampleLength), str(sampleWidth), str(sampleThickness), str(eHeavyHoleConcentration),str(molarCadmium), str(electronMobility)], stdout=subprocess.PIPE)
        outs, errs = proc.communicate()

        # let's suppose that MCTConsole saves output data into "input.txt" (I, Cbration, Thickness, B, Us,Uy) and "output.txt" (mu1 n1, mu2 n2, mu3 n3)
        inDataFile = open("input.txt",'r')
        temp = inDataFile.read()
        for i in range(0,len(temp)):
            loadedData[b,i]=t.split(" ") # or \t - we should check this

        outDataFile = open("output.txt",'r')
        temp = outDataFile.read()
        for i in range(0,len(temp)):
            resData[b,i]=t.split(" ") # or \t - we should check this
    
    return loadedData, resData

def write_hdf5(data, labels, output_filename):
    print("write_hdf5")
    """
    This function is used to save image data and its label(s) to hdf5 file.
    output_file contains data and label
    """
    x = data.astype(numpy.float32)
    y = labels.astype(numpy.float32)

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

    print("generating train_set")
    data, label = prepare_training_data(1000000000)
    # data - input
    # label - output
    write_hdf5(data, label, "train_set.h5")

    print("generating validation_set")
    data, label = prepare_training_data(10000000)
    write_hdf5(data, label, "validation_set.h5")

    print("generating check_set")
    data, label = prepare_training_data(1000000)
    write_hdf5(data, label, "check_set.h5")

if __name__ == "__main__":
    gen_data()

    