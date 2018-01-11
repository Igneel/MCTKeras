import h5py
from pwn import *

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


"""


def prepare_training_data():
    print("prepare_training_data")
    names = os.listdir(DATA_PATH)
    names = sorted(names)
    nums = names.__len__()
    data = numpy.zeros((nums * Random_Crop, 1, Patch_size, Patch_size), dtype=numpy.double)
    label = numpy.zeros((nums * Random_Crop, 1, label_size, label_size), dtype=numpy.double)
    for i in range(nums):
        name = DATA_PATH + names[i]
        hr_img = cv2.imread(name, cv2.IMREAD_COLOR)
        shape = hr_img.shape
        hr_img = cv2.cvtColor(hr_img, cv2.COLOR_BGR2YCrCb)
        hr_img = hr_img[:, :, 0]
        # produce Random_Crop random coordinate to crop training img
        if(min(shape[0], shape[1]) - label_size < 0):
            continue
        Points_x = numpy.random.randint(0, min(shape[0], shape[1]) - label_size, Random_Crop)
        Points_y = numpy.random.randint(0, min(shape[0], shape[1]) - label_size, Random_Crop)
        for j in range(Random_Crop):
            hr_patch = hr_img[Points_x[j]: Points_x[j] + label_size, Points_y[j]: Points_y[j] + label_size]
            lr_patch = cv2.resize(hr_patch, (label_size / scale, label_size / scale), cv2.INTER_CUBIC)
            lr_patch = lr_patch.astype(float) / 255.
            hr_patch = hr_patch.astype(float) / 255.
            data[i * Random_Crop + j, 0, :, :] = lr_patch
            label[i * Random_Crop + j, 0, :, :] = hr_patch
            # cv2.imshow("lr", lr_patch)
            # cv2.imshow("hr", hr_patch)
            # cv2.waitKey(0)
    return data, label

def write_hdf5(data, labels, output_filename):
    print("write_hdf5")
    """
    This function is used to save image data and its label(s) to hdf5 file.
    output_file.h5,contain data and label
    """

    x = data.astype(numpy.float32)
    y = labels.astype(numpy.float32)

    with h5py.File(output_filename, 'w') as h:
        h.create_dataset('data', data=x, shape=x.shape)
        h.create_dataset('label', data=y, shape=y.shape)
        # h.create_dataset()

if __name__ == "__main__":
	data, label = prepare_training_data()
    # data - input
    # label - output
    write_hdf5(data, label, "little_train.h5")


    inputVectorLength = 100 # Это тоже лучше читать из файла. Хотя для удобства подгоним размер, уж для обучения-то..
    temperature = 300-77 # Количество температур, для которых ведётся расчёт
    batch_size=32 # Размер обрабатываемой за один раз выборки

    # По входным данным предлагают вот что:
    # первой строкой сила тока, отношение длины к ширине, толщина
    # далее - магнитная индукция, напряжение магнитносопротивления, напряжение холла
    # температура идёт третьим измерением (т.к. такой тензор получаем)
    #
    #        3 - три столбца
    #        ______
    #       /| I  CBRatio Thickness
    #      / | B1 Us1     Uy1
    #     /  | ....................
    #    /T  | Bn Usn     Uyn


    loadedData = np.zeros([batch_size,temperature,inputVectorLength,3])

    resData = np.zeros([batch_size,temperature,3,3])
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