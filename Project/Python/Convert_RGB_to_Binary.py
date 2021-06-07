import cv2 as cv
import struct
from codecs import decode
import numpy


img = cv.imread('D:\CE\FPGA\RGB_to_Gray\Image\Songoku.jpg');
detail_file = open("Detail.txt","w")
img_width = img.shape[0]
detail_file.write(str(img_width)+"\n")
img_height = img.shape[1]
detail_file.write(str(img_height)+"\n")

#print(img_width)
#print(img_height)
file_write = open("binmap.in","w")
for i in range(0, img_width):
    for j in range(0, img_height):
        r = '%02X' % img[i, j][2]
        g = '%02X' % img[i, j][1]
        b = '%02X' % img[i, j][0]
        rgb = r+g+b

        file_write.write(rgb+"\n")
file_write.close()