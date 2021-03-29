import cv2 as cv
import numpy as np

f_detail = open("Detail.txt","r")
imaga_width = int(f_detail.readline())
image_height = int(f_detail.readline())

image_blank = np.zeros((image_height,imaga_width,3),np.float32)

f_True_Imange = open("Gray_Hex.txt","r")
f_Error_Image = open("bitmap.out","r")
f_result = open("result.txt","w")

f1_line = f_True_Imange.readline()
f2_line = f_Error_Image.readline()

pixel = []

while f1_line != '' or f2_line != '':
    pixel.append((int(f1_line,16) - int(f2_line,16))*255)
    f_result.write(str(int(f1_line,16) - int(f2_line,16)) +"\n")
    f1_line = f_True_Imange.readline()
    f2_line = f_Error_Image.readline()
k=0
for i in range(image_height):
    for j in range (imaga_width):
        image_blank[i][j] = (pixel[k],pixel[k],pixel[k])
        k = k +1

cv.imwrite("Image_Error_Check.png",image_blank)
cv.waitKey(0)
cv.destroyAllWindows()