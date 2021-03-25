# PJ RGB to GRAY Converter
## 1.  ModelSim - Quartus Prime Life:
* To install and run ModelSim, do step-by-step in link: https://www.youtube.com/watch?v=HfVTi0vN4Ks
*Running Modelsim on Ubuntu 20.04:
   * Open Terminal and run the path below to run Modelsim: ~/intelFPGA/20.1/modelsim_ase/bin/vsim
## 2.  Cocotb:
* To know how to write testbench by Python, check: https://indico.cern.ch/event/776422/attachments/1769690/2874927/cocotb_talk.pdf
## 3.  RGB -> Gray Algorithm:
*   Link: https://docs.opencv.org/3.4/de/d25/imgproc_color_conversions.html
## 4. Floating Point Unit (Datapath and Controller):
*   2 Operators: Add, Multiple
*   2 Converts: Float_to_Int, Int_to_Float
*   More Detail check FPU Folder.
## 5. RGB_2_GRAY:
* Take 19 Cycles to make the Result.
* Result is stored in "binmap.out" file.
* Error:
    * Max: 1'b1.
    * Min: 1'b0.
* Datapath: ![alt text](https://github.com/nhannm290/NNL/blob/main/Assignment/Week2/RGB_Datapath.png)
## 6. Imange:
We use image 800x533 pixel to run Example:
![Messi_RGB](https://github.com/nhannm290/NNL/blob/main/Assignment/Week2/messi.jpg)
## Result:
* The result is stored in bitmap.out and it is converted to RGB.png 
![Messi_GRAY](https://github.com/nhannm290/NNL/blob/main/Assignment/Week2/RGB.png)
* To check the Error: Run Check.py in Python Folder
* The Error is also converted to Image:
![ERROR_IMAGE](https://github.com/nhannm290/NNL/blob/main/Assignment/Week2/Result.png)
* Because the Error Value only 1 so, to see the Error Pixel we must multiply it with 255
* The Result is below
![Find_Error](https://github.com/nhannm290/NNL/blob/main/Assignment/Week2/Result_Error.jpg)
## 7. Run All in One:
* Still working 
