# MATLAB: Aligning RGB Channels (using SSD)

This repository contains the code for the final task of the [Computer Vision Basics](https://www.coursera.org/learn/computer-vision-basics) on Coursera, offered by University at Buffalo and The State University of New York.

## Task Description

The goal of this project is to learn to work with images in Matlab by taking the digitized glass plate images and automatically producing a color image with as few visual artifacts as possible. In order to do this, you will need to extract the three color channel images, place them on top of each other, and **align them** so that they form a single RGB color image.

The easiest way to align the parts is to exhaustively search over a window of possible displacements (You will search [-10,10] pixels), score each one using some image matching metric, and take the displacement with the best score. The simplest one is the Sum of Squared Differences (SSD) distance, which simple subtracts one image region from the other and evaluates the sum of the squared values in each pixel. You need to do SSD based calculations on image regions which are of [double](https://www.mathworks.com/help/matlab/ref/double.html) type.

As R,G,B channels are highly correlated to each other, SSD metric is very likely to work. Your task is to hold the G channel as the reference and move around R and B channels over it, and keep track of the SSD value for the 51x51 image regions at the center of the channels. For each channel, you will find the (x,y) displacement vector that gives the minimum SSD value.

The program should divide the image into three equal parts. The first image is Blue Channel, the second one is Green channel and the last one is Red channel.

You have to name your variables as below

Blue channel Image - B

Green channel Image - G

Red channel Image - R

Reference Green Channel center region (51x51) -  **ref_img_region** (center of this region coincides with center of image and indexes are always integers)

Final aligned image - ColorImg_aligned

Image in reduced size is shown below.

![course1image](https://github.com/AhmedIsmail007/Aligning-RGB-Channels-using-SSD/assets/108105551/338e7f59-841f-4d19-8a75-1db9f71722dc)

Output image is shown below.

![aligned_image](https://github.com/AhmedIsmail007/Aligning-RGB-Channels-using-SSD/assets/108105551/831b3d09-ae9d-499e-af35-ce1d1f257693)


## Code Overview

- `align_rgb_channels.m`: This is the main MATLAB script that performs the alignment of RGB channels using the SSD metric, including **'offset'** function, which calculates the minimum offset for R and B channels using the SSD metric.
- `course1image.jpg`: Input image.

## Usage

1. Clone the repository:

   ```shell
   git clone https://github.com/AhmedIsmail007/Aligning-RGB-Channels-using-SSD.git
