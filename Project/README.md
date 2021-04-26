# Convolutional Neural Networks
Mạng Nơ-ron tích chập (Convolutional Neural Networks) còn được gọi là CNNs hay ConvNets bao gồm lớp đầu vào và lớp đầu ra và bên trong là những lớp ẩn (hidden layers). 

Các lớp ẩn của mạng thường bao gồm: Nhiều lớp tích chập (Convolutional), lớp tổng hợp (Pooling), lớp kết nối đầy đủ (Fully connected), và theo sau các lớp ẩn là các hàm kích hoạt,(ReLU,SOFTMAX…)
![image](https://user-images.githubusercontent.com/80024215/115451412-5c4f2300-a247-11eb-947a-bb1746d44ff1.png)
## Quá trình tích chập (Convolution)
![Convolution_schematic](https://user-images.githubusercontent.com/80024215/115451561-8c96c180-a247-11eb-83f5-261270f77cfb.gif)



## Pooling (Quá trình tổng hợp)
- Thường được sử dụng ngay sau lớp convulational để đơn giản hóa thông tin đầu ra để giảm bớt số lượng neuron.
- Thông thường có hai loại Max-pooling và Average-pooling.
- Max-pooling: Lấy giá trị lớn nhất của lớp tích chập.
- Average-pooling: Lấy giá trị trung bình của lớp tích chập.

![image](https://user-images.githubusercontent.com/80024215/115450758-86541580-a246-11eb-85ba-f967d53856a1.png)
- Ví dụ trong hình trên:

  Max-pooling có giá trị là 112

  Average-pooling có giá trị là 30
## Fully Connected Layer – Lớp kết nối đầy đủ
-	Các lớp kết nối đầy đủ lấy hình ảnh đã lọc ở cấp cao (Convolution và Pooling) và chuyển chúng thành phiếu bầu (vote). Mỗi giá trị bỏ phiếu riêng bầu cho hình ảnh cần nhận diện.
## Bước nhảy - Stride
- Stride là số pixel thay đổi trên ma trận đầu vào. 
- Khi stride là 1 thì ta di chuyển các kernel 1 pixel. Khi stride là 2 thì ta di chuyển các kernel đi 2 pixel và tiếp tục như vậy.
## Đường viền - Padding
## Các hàm kích hoạt
### Rectified Linear Units – ReLU (Tinh chỉnh các đơn vị tuyến tính)
-	Bất cứ nơi nào có số âm, hoán đổi nó với 0. Điều này giúp CNN giữ vững sự tin cậy toán học bằng cách giữ các giá trị đã được học khỏi bị mắc kẹt gần 0 hoặc về vô tận.
![image](https://user-images.githubusercontent.com/80024215/115451328-3fb2eb00-a247-11eb-800c-ca71437673ca.png)

# Xception Architecture
Các thông số cơ bản về kiến trúc Xception:

  INPUT ảnh 299x299x3

  OUTPUT

  Số lớp Layer 70

  Số Parameters sử dụng: 22,910,480

![image](https://user-images.githubusercontent.com/80024215/115450056-a6370980-a245-11eb-967b-ce68b3d3ef2a.png)
## So sánh tương quan giữa các mạng
 ![image](https://user-images.githubusercontent.com/80024215/115452348-848b5180-a248-11eb-9ac0-bc9f2a11d284.png)
Hình ảnh đưa ra sự so sánh về kiến trúc Xception với những kiến trúc khác cho thấy Xception tối ưu hơn những thuật toán còn lại về Size, Top Accuracy, Parameters,...

