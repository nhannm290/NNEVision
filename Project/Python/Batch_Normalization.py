import math
import struct
import os
current_dir = os.getcwd()

path = "/Project/Python/Weight_File/Convo1/"

def float_to_bin(num):
    return format(struct.unpack('!I', struct.pack('!f', num))[0], '032b')
    print(float_to_bin(-3.39298397e-02)) 

Moving_Mean_Address = current_dir +path +"conv1_1_running_mean.txt"
Moving_Variance_Address = current_dir +path +"conv1_1_running_var.txt"

A_Address = current_dir +path +"A.txt"
B_Address = current_dir +path +"B.txt"


file_Mean = open(Moving_Mean_Address,"r")
file_Variance = open(Moving_Variance_Address, "r")

file_A = open(A_Address,"w")
file_B = open(B_Address,"w")


line_Mean = file_Mean.readline()
line_Variance = file_Variance.readline()

while line_Mean !="" and line_Mean !="":
    gama = 1
    beta = 0
    mean = float(line_Mean)
    variance = float(line_Variance)

    A = gama / (math.sqrt(variance+0.001))
    file_A.write(float_to_bin(A)+"\n")
    B = beta - A * mean 
    file_B.write(float_to_bin(B) +"\n")
    line_Mean = file_Mean.readline()
    line_Variance = file_Variance.readline()

file_A.close()
file_B.close()

file_Mean.close()
file_Variance.close()

