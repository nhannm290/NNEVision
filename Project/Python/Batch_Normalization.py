import math

Gama_Address = ""
Beta_Address = ""
Moving_Mean_Address = ""
Moving_Variance_Address = ""

A_Address = ""
B_Address = ""

file_Gama = open(Gama_Address,"r")
file_Beta = open(Beta_Address,"r")
file_Mean = open(Moving_Mean_Address,"r")
file_Variance = open(Moving_Variance_Address, "r")

file_A = open(A_Address,"w")
file_B = open(B_Address,"w")

line_Gama = file_Gama.readline()
line_Beta = file_Beta.readline()
line_Mean = file_Mean.readline()
line_Variance = file_Variance.readline()

while line_Beta != "" and line_Gama !="" and line_Mean !="" and line_Mean !="":
    gama = float(line_Gama)
    beta = float(line_Beta)
    mean = float(line_Mean)
    variance = float(line_Variance)

    A = gama / (math.sqrt(variance+0.001))
    file_A.write(str(A)+"\n")
    B = beta - A * mean 
    file_B.write(str(B) +"\n")

file_A.close()
file_B.close()
file_Beta.close()
file_Gama.close()
file_Mean.close()
file_Variance.close()

