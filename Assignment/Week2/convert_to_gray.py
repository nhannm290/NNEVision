import cv2
import numpy as np

#Load image
image = cv2.imread('messi.jpg')
#Show image
cv2.imshow('messi',image)
cv2.waitKey()

# convert gray image
gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

# save to new file
cv2.imwrite('messi_gray.png',gray_image)
cv2.imshow("messi_gray", gray_image)
cv2.waitKey(0)
cv2.destroyAllWindows()
