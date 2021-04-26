# Convolutional Neural Networks
Convolutional Neural Networks is called CNNs or ConvNets include input layer and output layer and hidden layers. 

Hidden layers include: Convolutional, Pooling, Fully connected, and some activation layer(ReLU,SOFTMAX…)
![image](https://user-images.githubusercontent.com/80024215/115451412-5c4f2300-a247-11eb-947a-bb1746d44ff1.png)
## Convolution
![Convolution_schematic](https://user-images.githubusercontent.com/80024215/115451561-8c96c180-a247-11eb-83f5-261270f77cfb.gif)



## Pooling
- Use after convulational layer to simplify output information and reduces number of neuron.
- Include two type: Max-pooling and Average-pooling.
- Max-pooling: Get maximun value of Convolutional Layer.
- Average-pooling: Get average value of Convolutional Layer.

![image](https://user-images.githubusercontent.com/80024215/115450758-86541580-a246-11eb-85ba-f967d53856a1.png)
- Example with above picture:

  Value of Max-pooling is 112

  Value of Average-pooling is 30
## Fully Connected Layer 
-	The fully connected layers take high-level filtered images (Convolution and Pooling) and convert them into votes. Each vote value individually votes for the image to be identified.
## Stride
- Stride is the number of pixels changed on the input matrix. 
- When stride is 1 we move the kernels by 1 pixel. When stride is 2 we move the kernels 2 pixels away and so on.
![image](https://images.deepai.org/django-summernote/2019-06-03/56e53bc1-bac3-48f4-a08c-dce77a57464b.png)
## Padding
- Zero-padding denotes the process of adding PP zeroes to each side of the boundaries of the input. This value can either be manually specified or automatically set through one of the three modes detailed below:

| Tables   -----     | Are           | Cool  |
| Tables        | Are           | Cool  |
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |


## Các hàm kích hoạt
### Rectified Linear Units – ReLU (Tinh chỉnh các đơn vị tuyến tính)
-	Bất cứ nơi nào có số âm, hoán đổi nó với 0. Điều này giúp CNN giữ vững sự tin cậy toán học bằng cách giữ các giá trị đã được học khỏi bị mắc kẹt gần 0 hoặc về vô tận.
![image](https://user-images.githubusercontent.com/80024215/115451328-3fb2eb00-a247-11eb-800c-ca71437673ca.png)

# Xception Architecture
Các thông số cơ bản về kiến trúc Xception:

  INPUT ảnh 299x299x3

  OUTPUT(Floating Point)

  Số lớp Layer 70

  Số Parameters sử dụng: 22,910,480

![image](https://user-images.githubusercontent.com/80024215/115450056-a6370980-a245-11eb-967b-ce68b3d3ef2a.png)
## So sánh tương quan giữa các mạng
 ![image](https://user-images.githubusercontent.com/80024215/115452348-848b5180-a248-11eb-9ac0-bc9f2a11d284.png)
Hình ảnh đưa ra sự so sánh về kiến trúc Xception với những kiến trúc khác cho thấy Xception tối ưu hơn những thuật toán còn lại về Size, Top Accuracy, Parameters,...

