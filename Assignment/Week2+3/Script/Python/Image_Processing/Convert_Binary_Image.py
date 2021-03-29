import numpy as np
import cv2 as cv
detail_file = open("Detail.txt","w")
img_width = detail_file.readline();
img_hight = detail_file.readline();
image=np.zeros((1080,1920,3),np.float32)
f = open('bitmap.out', 'r')
pixel = []
for x in f:
    pixel.append(int(x,16))
k=0
for i in range(img_width):
    for j in range(img_hight):
       image[i,j] = (pixel[k],pixel[k],pixel[k])
       k = k+1
cv.imwrite('Result.jpg',image)
cv.imshow('Result_Error',image)
cv.waitKey(0)
cv.destroyAllWindows()