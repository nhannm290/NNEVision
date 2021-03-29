f_check = open("Result.txt","r")
f_detail = open ("Detail.txt","r")
wight = f_detail.readline()
hight = f_detail.readline()
Total_Pixel = wight*hight
Count = 0

f_line = f_check.readline()
while f_line != '':
    Count = Count + int(f_line)
    f_line = f_check.readline()

print((Count/Total_Pixel)*100)