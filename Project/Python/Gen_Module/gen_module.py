
# module name_module #(parameter IMG_WIDHT =15,parameter IMG_HEIGHT = 15,parameter IMG_DEPTH = 32)
# (
#     input [95:0] Data_In,
#     input Valid_In,
#     input clk,
#     input rst,
#     output [31:0] Data_Out,
#     output Valid_Out 
# )

import os
current_dir = os.getcwd()

def file_open(path,name_file,mode):
    file = open(path+name_file+".txt",str(mode))
    return file.read()


def file_read (path,name):
    file = open(path+name+".txt","r")
    return file.read()

def convo(img_widht = 299,img_height = 299, img_depth = 32):
    name_file = "convo2D_" + str(img_depth) 
    file = open(current_dir+"/Project/Python/Gen_Module/Module/"+name_file+".txt","w")
    #modelue top #(parameter img_widht = 299,parameter img_height = 299,parameter img_depth = 32)
    out = "module "+name_file+ "\t#(parameter img_widht ="+str(img_widht)+",parameter img_height ="+str(img_height) +"," +"parameter img_depth =" + str(img_depth) +")\n"
    out += "(\n"
    out += "\t\t" + "input [95:0] Data_In,\n"
    out += "\t\t" + "input Valid_In,\n"
    out += "\t\t" + "input clk,\n"
    out += "\t\t" + "input rst,\n"
    for i in range(0,img_depth):
        out += "\t\t" + "output [31:0] Data_Out"+str(i)+",\n"
    out += "\t\t" +"output Valid_Out" 
    file.write(out)
    file.close()


convo(img_widht = 149,img_height = 149, img_depth = 64)