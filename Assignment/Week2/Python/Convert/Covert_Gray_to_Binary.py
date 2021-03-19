import cv2 as cv
import struct
from codecs import decode
import numpy
import string


img = cv.imread('messi_gray.png');
img_width = img.shape[0]
img_height = img.shape[1]

#print(img_width)
#print(img_height)
file_write = open("Gray_Hex.txt","w")
for i in range(0, img_width):
    for j in range(0, img_height):
        gray = ('%02X' % img[i][j][2]).lower()
        print(gray)
        file_write.write(gray + "\n")
file_write.close()