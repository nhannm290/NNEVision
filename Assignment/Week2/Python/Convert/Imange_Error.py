import cv2 as cv
import numpy as np

image_blank = np.zeros((533,800),dtype=float)

f_True_Imange = open("Gray_Hex.txt","r")
f_Error_Image = open("bitmap.out","r")

for i in range(533):
    for j in range(800):
        data_true = f_True_Imange.readline()
        data_error = f_Error_Image.readline()
        int_data_true = int(data_true,16)
        int_data_error = int(data_error,16)
        image_blank[i][j] = float(int_data_true-int_data_error)/255
cv.imwrite("Image_Error_Check.png",image_blank)
cv.imshow('Image_Sult',image_blank)
cv.waitKey(0)
cv.destroyAllWindows()