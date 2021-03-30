import cv2
import numpy as np
import os
cap = cv2.VideoCapture('Butterflies.mp4')
file_write = open("binmap_Video.in","w")

parent_path = "D:/CE/FPGA/RGB_to_Gray"
def Convert_Image_To_Binary(video_frame,path,number):
    name_file = "./Binmap_Video/binmap_" + str(number) + ".in" 
    file_binmap = open(name_file,"w")
    img = cv2.imread(path);
    detail_file = open("Detail_Video.txt","w")
    img_width = img.shape[0]
    detail_file.write(str(img_width)+"\n")
    img_height = img.shape[1]
    detail_file.write(str(img_height)+"\n")
    for i in range(0, img_width):
        for j in range(0, img_height):
            r = '%02X' % img[i, j][2]
            g = '%02X' % img[i, j][1]
            b = '%02X' % img[i, j][0]
            rgb = r+g+b
            file_write.write(rgb+"\n")
            file_binmap.write(rgb+"\n")
    file_binmap.close()
    detail_file.close()
    return
try:
    if not os.path.exists('data'):
        os.makedirs('data')
except OSError:
    print ('Error: Creating directory of data')
Number_Frame = 1
while(Number_Frame != 450):
    ret, frame = cap.read()
    name = './data/frame' + str(Number_Frame) + '.jpg'
    cv2.imwrite(name, frame)
    print ('Creating...' + name)
    Convert_Image_To_Binary(frame,name,Number_Frame)
    Number_Frame += 1

file_write.close()
cap.release()
cv2.destroyAllWindows()