import cv2
import numpy as np

#Load image
image = cv2.imread('D:\CE\FPGA\RGB_to_Gray\Image\Solo_Leveling.jpg')
#Show image
cv2.imshow('Solo_Leveling',image)
cv2.waitKey()

# convert gray image
gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
# save to new file
cv2.imwrite('Solo_Leveling_gray.png',gray_image)
cv2.imshow("Solo_Leveling_gray", gray_image)
cv2.waitKey(0)
cv2.destroyAllWindows()
