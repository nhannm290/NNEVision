# 1. Setup Environments
## Create Github Repo 
[Github Repo](https://docs.github.com/en/github/getting-started-with-github/create-a-repo)
## Install Ubuntu Desktop 18.04 or later
[Ubuntu Desktop](https://ubuntu.com/download/desktop)
## Install Python 3.9.2 on Ubuntu
[Python 3.9.2](https://www.python.org/downloads/)
## Install OpenCV-Python Package
[OpenCV - Python](https://pypi.org/project/opencv-python/)
# 2. Write a "Hello World" app
## Read, Write and Display a video/webcam using OpenCV python
**Capture and write an image to file.**
     
    import cv2
    camera = cv2.VideoCapture(0)

    cv2.namedWindow("test")
    img_counter = 0

    while True:
    ret, frame = camera.read()
    if not ret:
        print("Failed to grab frame")
        break
    cv2.imshow("test", frame)

    k = cv2.waitKey(1)
    if k%256 == 27:
        # ESC pressed
        print("Exiting...")
        break
    elif k%256 == 32:
        # SPACE pressed
        img_name = "opencv_frame_{}.png".format(img_counter)
        cv2.imwrite(img_name, frame)
        print("{} Written!".format(img_name))
        img_counter += 1

    cam.release()
    cv2.destroyAllWindows()
**Write and display webcam**

     I'm on my way...
     
**Read and play a video**

    import numpy as np
    import cv2
    #Create a video and read from input file
    
    
    cap = cv2.VideoCapture('/home/nhannm29/Downloads/schdtx.mp4')
    while (cap.isOpened()):
    ret, frame = cap.read()
    if not ret:
        print("Displaying currently is not working...try again")
        break
    
    cv2.imshow('SCHDTX',frame)

    #Press q to stop video
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
    
     cap.release()
     cv2.destroyAllWindows()
 **Write and play a video**
 
    import numpy as np
    import cv2
    #Choose the video you want to write
    video = cv2.VideoCapture('/home/nhannm29/Downloads/schdtx.mp4')


    #settings for written video
    frame_width = int(video.get(3))
    frame_height = int(video.get(4))
    fourcc = cv2.VideoWriter_fourcc(*'MP4V')
    fps = 30

    #The written video will be saved at the path below
    out = cv2.VideoWriter('/home/nhannm29/Downloads/schdtx1.mp4',fourcc, fps, (frame_width,frame_height))

    #start writing the video
    while(True):
     ret, frame = video.read()

    if ret == True: 
    out.write(frame)
    cv2.imshow('WrittenVideo',frame)

    #press q to stop writing video at scene you want
    if cv2.waitKey(1) & 0xFF == ord('q'):
      break
    else:
    break  

    video.release()
    out.release()
    cv2.destroyAllWindows()
