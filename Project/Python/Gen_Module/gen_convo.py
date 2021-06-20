# module Convolution3D_3x3_stride2x2_3_Channel #(parameter IMG_WIDHT = 299,parameter IMG_HEIGHT = 299) (
#     input [31:0] Channel0,
#     input [31:0] Channel1,
#     input [31:0] Channel2,
#     input [31:0] Kernel0,
#     input [31:0] Kernel1,
#     input [31:0] Kernel2,
#     input [31:0] Kernel3,
#     input [31:0] Kernel4,
#     input [31:0] Kernel5,
#     input [31:0] Kernel6,
#     input [31:0] Kernel7,
#     input [31:0] Kernel8,
#     input [31:0] Kernel9,
#     input [31:0] Kernel10,
#     input [31:0] Kernel11,
#     input [31:0] Kernel12,
#     input [31:0] Kernel13,
#     input [31:0] Kernel14,
#     input [31:0] Kernel15,
#     input [31:0] Kernel16,
#     input [31:0] Kernel17,
#     input [31:0] Kernel18,
#     input [31:0] Kernel19,
#     input [31:0] Kernel20,
#     input [31:0] Kernel21,
#     input [31:0] Kernel22,
#     input [31:0] Kernel23,
#     input [31:0] Kernel24,
#     input [31:0] Kernel25,
#     input [31:0] Kernel26,
#     input Valid_In,
#     input clk,
#     input rst,
#     output [31:0] Data_Out,
#     output Valid_Out
# );

import os
import copy

current_dir = os.getcwd()

def convo(img_widht = 299,img_height = 299, img_depth = 32,name_module ="convo"):
    path_weight= "/Project/Python/Weight_File/block_convo2d_"
    path_module = "/Project/Python/Gen_Module/Module"
    name_file = "block_convo2d_0"
    path_result = ""

    out = "module "+name_file+ "\t#(parameter img_widht ="+str(img_widht)+",parameter img_height ="+str(img_height) +"," +"parameter img_depth =" + str(img_depth) +")\n"
    out += "(\n"
    out += "\t\t" + "input [95:0] Data_In,\n"
    out += "\t\t" + "input Valid_In,\n"
    out += "\t\t" + "input clk,\n"
    out += "\t\t" + "input rst,\n"
    for i in range(0,img_depth):
        out += "\t\t" + "output [31:0] Data_Out"+str(i)+",\n"
    out += "\t\t" +"output Valid_Out\n"
    out += "\t\t" +");" 

    # for j in range (0,img_depth):
        #ptiny submodule convo2d_32

    