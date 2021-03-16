import cv2 as cv
import numpy as np

image=np.zeros((500,500),dtype=float)
fi =open('Gray_Decimal.txt', 'r')
for i in range(500):
    for j in range(500):
        data_read = fi.readline()
        image[i][j] = float(data_read)/255

cv.imshow('Gray_Out',image)
cv.waitKey(0)
cv.destroyAllWindows()
