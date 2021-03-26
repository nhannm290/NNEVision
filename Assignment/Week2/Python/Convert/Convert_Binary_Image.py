import numpy as np
import cv2 as cv

f_detail = open("Detail.txt","r")
imaga_width = int(f_detail.readline())
image_height = int(f_detail.readline())

image_blank = np.zeros((image_height,imaga_width,3),np.float32)
f = open('bitmap.out', 'r')
pixel = []
for x in f:
    pixel.append(int(x,16))
k=0
for i in range(image_height):
    for j in range(imaga_width):
       image[i,j] = (pixel[k],pixel[k],pixel[k])
       k = k+1
cv.imwrite('Result.jpg',image)
cv.imshow('Result_Error',image)
cv.waitKey(0)
cv.destroyAllWindows()
