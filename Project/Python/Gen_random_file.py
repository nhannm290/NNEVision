import numpy as np
import os
current_dir = os.getcwd()

import struct
IMG_WIDTH = 48
IMG_HEIGHT = 48
path_Testbench = "/Project/Testbench/"
path_Python= "/Project/Python/"




def Gen_File(IMG_HEIGHT=220,IMG_WIDTH=220,current_dir = current_dir,path =path_Testbench,name_file="Testfile.txt"):
    file = open(current_dir+path+name_file,"w")
    for i in range(IMG_HEIGHT):
        for j in range(IMG_WIDTH):
            num_rand = np.random.randint(255)
            file.write(str(num_rand)+"\n")
    file.close()        

def Convert_File (current_dir = current_dir,path =path_Testbench,name_file_read="Testfile.txt",name_file_write ="Testfile_Convert.txt"):
    file_read = open(current_dir+path+name_file_read,"r") 
    file_write = open(current_dir+path+name_file_write,"w")

    for line in file_read:
        file_write.write(str(float_to_bin(int(line.split("\n")[0])))+"\n")

    file_write.close()
    file_read.close()

def Convert_File_to_Matrix(current_dir = current_dir,path =path_Testbench,name_file_read="Testfile.txt",name_file_write ="Matrix_Convert.txt"):
    matrix = np.zeros((IMG_HEIGHT,IMG_WIDTH))
    file_read = open(current_dir+path+name_file_read,"r") 
    file_write_Matrix_Convert = open(current_dir+path+name_file_write,"w")
    file_write_Matrix =  open(current_dir+path+"Matrix.txt","w")
    line = file_read.readline()
    for i in range(IMG_HEIGHT):
        for j in range(IMG_WIDTH):
            matrix[i][j] = int(line)
            line = file_read.readline()
    submatrix = np.zeros((3,3))
    for i in range(IMG_HEIGHT):
        for j in range(IMG_WIDTH):
            if j < IMG_WIDTH-2 and i < IMG_WIDTH-2:
                submatrix = matrix[i:i+3,j:j+3]
                if len(submatrix) == 3 and len(submatrix[0]==3):
                    result_Convert = ""
                    result = ""
                    for k in range(3):
                        for l in range (3):
                            result += str(submatrix[k][l])+"\t"
                            binary = str(float_to_bin(submatrix[k][l]))
                            result_Convert = result_Convert + str(hex(int(binary,2)).split("0x")[1]) +"\t"
                    result_Convert = result_Convert +"\n"
                    result += "\n"
                    file_write_Matrix_Convert.write(result_Convert)
                    file_write_Matrix.write(result)

def Check_File(current_dir = current_dir,path =path_Testbench,name_file_source="Matrix_Convo_temp.txt",name_file_check ="RTL_Convo_Result.txt",name_file_result ="Result_Convo_Check.txt"):
    file_source = open(current_dir+path+name_file_source,"r")
    file_check = open(current_dir+path+name_file_check,"r")
    file_resul = open(current_dir+path+name_file_result,"w")

    line_source = file_source.readline()
    
    line_check = file_check.readline()
    counter =0
    while line_source !="" and line_check != "":
        
        # print(array_source)
        # print("*"*5)
        # print(array_check)
        # print("*"*5)
        # print(int(array_check[8]))
        # for i in range(9):
        #     str_source = str(array_source[i])
        #     str_check =  str(array_check[i])
        #     if str_source == "0":
        #         str_source ="00000000"
        #     if "\n" in str_check:
        #         str_check = str_check.split("\n")[0]
        #     if str_source == str_check:
        #         file_resul.write("pass\n")
        #     else:
        #         file_resul.write("false\n")
        if line_source == "0" and line_check == "00000000" :
            file_resul.write("pass\n")
        if line_source == line_check:
            file_resul.write("pass\n")
        else:  
            file_resul.write("failse\n") 
        line_source = file_source.readline()
        line_check = file_check.readline()
    file_source.close()
    file_check.close()
    file_resul.close()




def Convert_File_to_Matrix_Convolution(current_dir = current_dir,path =path_Testbench,name_file_read="Testfile.txt",name_file_write ="Matrix_Convo_Temp.txt"):
    matrix = np.zeros((IMG_HEIGHT,IMG_WIDTH))
    file_read = open(current_dir+path+name_file_read,"r") 
    file_write = open(current_dir+path+name_file_write,"w")
    line = file_read.readline()
    for i in range(IMG_HEIGHT):
        for j in range(IMG_WIDTH):
            matrix[i][j] = int(line)
            line = file_read.readline()
    submatrix = np.zeros((3,3))
    for i in range(IMG_HEIGHT):
        for j in range(IMG_WIDTH):
            if j < (IMG_WIDTH-2) and i < (IMG_WIDTH-2):
                submatrix = matrix[i:i+3,j:j+3]
                if len(submatrix) == 3 and len(submatrix[0]==3):
                    result = ""
                    number_result = submatrix[0][0] * 1 + submatrix[0][2] * (-1) + submatrix[1][0] * 2 + submatrix[1][2] *-2 + submatrix[2][0] *1 + submatrix[2][2] *(-1)
                    binary = str(float_to_bin(number_result))
                    result =str(hex(int(binary,2)).split("0x")[1])
                    result = result +"\n"
                    file_write.write(result)

def float_to_bin(num):
    return format(struct.unpack('!I', struct.pack('!f', num))[0], '032b')

def Layer1(current_dir = current_dir,name_file_read_Matrix="Testfile.txt",name_file_read_Kernel="conv1_0_weight_num.txt",name_file_write ="Layer1.txt"):
    file_read_Matrix = open(current_dir+path_Testbench+name_file_read_Matrix,"r")
    file_read_Kernel = open(current_dir+path_Python+"/Weight_File/Convo1/"+name_file_read_Kernel,"r")
    file_write_Result = open(current_dir+path_Testbench+name_file_write,"w")

    file_read_A =  open(current_dir+path_Python+"/Weight_File/Convo1/A_num.txt","r")
    file_read_B =  open(current_dir+path_Python+"/Weight_File/Convo1/B_num.txt","r")
    line = file_read_Matrix.readline()
    matrix = np.zeros((IMG_HEIGHT+2,IMG_WIDTH+2))
    for i in range(IMG_HEIGHT):
            for j in range(IMG_WIDTH):
                matrix[i][j] = int(line)
                line = file_read_Matrix.readline()
    #load Kernel

    line_kernel = file_read_Kernel.readline()
    array =np.zeros((8,3,3))
    for k in range(8):
        for i in range (3):
            for j in range (3):
                array[k][i][j] = float(line_kernel)
                line_kernel = file_read_Kernel.readline()
    print(array)
    A = []
    line_A = file_read_A.readline()
    for i in range (8):
        A.append(float(line_A))
        line_A = file_read_A.readline()
    print(A)
    B = []
    line_B = file_read_B.readline()
    for i in range (8):
        B.append(float(line_B))
        line_B = file_read_B.readline()
    print(B)
    submatrix = np.zeros((3,3))
    for i in range(IMG_HEIGHT):
        for j in range(IMG_WIDTH):
            if i < IMG_WIDTH-2 and j < IMG_WIDTH-2:
                submatrix = matrix[i:i+3,j:j+3]
                result = ""
                for k in range (8):
                    temp_result = submatrix[0][0] * array[k][0][0] +submatrix[0][1] * array[k][0][1] +submatrix[0][2] * array[k][0][2] + submatrix[1][0] * array[k][1][0] +submatrix[1][1] * array[k][1][1] +submatrix[1][2] * array[k][1][2] + submatrix[2][0] * array[k][2][0] + submatrix[2][1] * array[k][2][1] +submatrix[2][2] * array[k][2][2]
                    temp_result = temp_result*A[k] +B[k]
                    if temp_result <0:
                        binary = "00000000"
                    else:
                        binary = str(float_to_bin(temp_result))

                    if (k == 7):
                        result += str(hex(int(binary,2)).split("0x")[1]) +"\n"
                    else: 
                        result += str(hex(int(binary,2)).split("0x")[1]) +"\t"
                file_write_Result.write(result)




Gen_File(IMG_HEIGHT = 48,IMG_WIDTH = 48,name_file="TestFile_48x48.txt",path = path_Testbench)
Convert_File(name_file_read="TestFile_48x48.txt",name_file_write="TestFile_48x48_Convert.txt",path = path_Testbench)