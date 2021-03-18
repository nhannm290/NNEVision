import cv2
import numpy as np

#Load image
image = cv2.imread('messi.jpg')
#convert image
resized_img = cv2.resize(image,(500,500),interpolation=cv2.INTER_AREA)
cv2.waitKey()
b,g,r = cv2.split(resized_img)
gray_result = (0.299*r + 0.587*g + 0.114*b)/255
out_gray = open('Gray_Decimal.txt','w')
gray_result = np.array(gray_result)
#write gray image
for i in range(500):
    for j in range (500):
        out_gray.write(str(gray_result[i][j])+ '\n')
cv2.imshow("messi_gray", gray_result)
cv2.waitKey(0)
cv2.destroyAllWindows()
