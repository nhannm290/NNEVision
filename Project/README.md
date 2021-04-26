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

| **Mode**        | Valid           | Same  | Full|
| :------------- |:-------------:| :-----:| :---:|
| **Value**      | ![image](https://user-images.githubusercontent.com/80077471/116117199-2cd86480-a6e6-11eb-84dc-11e2be71a31f.png) | ![image](https://user-images.githubusercontent.com/80077471/116117437-7032d300-a6e6-11eb-88c5-f3c2734330f3.png) |![image](https://user-images.githubusercontent.com/80077471/116117540-8c367480-a6e6-11eb-9a12-088bf0b65fa6.png)|
| **Illustration**      | ![image](https://stanford.edu/~shervine/teaching/cs-230/illustrations/padding-valid-a.png?1f58d78612f6202ce201620919d71609)      | ![image](https://stanford.edu/~shervine/teaching/cs-230/illustrations/padding-same-a.png?8b680283b10a6e131209b74e21a61213)  |![image](https://stanford.edu/~shervine/teaching/cs-230/illustrations/padding-full-a.png?b51e98467c8a77574c7e8f108654ad95)|
| **Purpose** | ![image](https://user-images.githubusercontent.com/80077471/116118273-4fb74880-a6e7-11eb-8506-6a0b7b9ba01e.png)    |   ![image](https://user-images.githubusercontent.com/80077471/116118212-45954a00-a6e7-11eb-94f6-532c57bae3b0.png) |![image](https://user-images.githubusercontent.com/80077471/116118317-5a71dd80-a6e7-11eb-921f-384a8bbd1dc9.png)|

## Commonly used activation functions
### Rectified Linear Units – ReLU 
-	The rectified linear unit layer (ReLU) is an activation function ![image](https://user-images.githubusercontent.com/80077471/116118546-a15fd300-a6e7-11eb-84cc-0f20f340eb88.png) that is used on all elements of the volume. It aims at introducing non-linearities to the network. Its variants are summarized in the table below:
![image](https://user-images.githubusercontent.com/80077471/116118646-bc324780-a6e7-11eb-8632-3b47fa6f0f32.png)
- How does the ReLU work
![image](https://user-images.githubusercontent.com/80024215/115451328-3fb2eb00-a247-11eb-800c-ca71437673ca.png)
### Softmax
- The softmax step can be seen as a generalized logistic function that takes as input a vector of scores ![image](https://user-images.githubusercontent.com/80077471/116120029-4fb84800-a6e9-11eb-9b7d-6d22c239622c.png) and outputs a vector of output probability ![image](https://user-images.githubusercontent.com/80077471/116120151-6d85ad00-a6e9-11eb-996b-e77e34cea914.png) through a softmax function at the end of the architecture. It is defined as follows:
![image](https://user-images.githubusercontent.com/80077471/116120219-83936d80-a6e9-11eb-99b0-98e4a731554f.png)



# Xception Architecture
Xception Architecture Specifications:

  INPUT image 299x299x3

  OUTPUT(Floating Point)

  Number of Layer: 70

  Parameters used: 22,910,480
## Basic Flow Of Xception Architecture

![image](https://user-images.githubusercontent.com/80024215/115450056-a6370980-a245-11eb-967b-ce68b3d3ef2a.png)
## Correlation Comparison Between Betworks
 ![image](https://user-images.githubusercontent.com/80024215/115452348-848b5180-a248-11eb-9ac0-bc9f2a11d284.png)
Hình ảnh đưa ra sự so sánh về kiến trúc Xception với những kiến trúc khác cho thấy Xception tối ưu hơn những thuật toán còn lại về Size, Top Accuracy, Parameters,...

