import numpy as np
import cv2 as cv

image=np.zeros((533,800),dtype=float)
f = open('bitmap.out', 'r')

for i in range(533):
    for j in range(800):
        data_read = f.readline()
        int_data = int(data_read,16)
        image[i][j] = float(int_data)/255
cv.imwrite("RGP_GRAY_Verilog.png",image)
cv.imshow('Gray_Out',image)
cv.waitKey(0)
cv.destroyAllWindows()