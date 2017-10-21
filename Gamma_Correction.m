clear;
close all; %Reading an image from a .png file into a 3D array (for colour images or 3D array for grayscale images)
I = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\a01images\im02small.png');
figure;
imshow(I);
title('Original Image');

I_Gray = rgb2gray(I);  %Using matlab function to convert to a grayscale image
figure;
imshow(I_Gray);
title('Original Grayscale Image');
imwrite(I_Gray,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Gamma_Correction\im01small_gray.png');

I_double = im2double(I); % Converts uint8 format to double format and returns the new image. where uint8 0-255 and double 0-1, hence we have decimal point values.
I_Gray_double = im2double(I_Gray);
gamma = input('Enter gamma value: '); % Takes Gamma value as an input.
c = 1/(1.0^gamma);

I_gamma = min(c*(I_double.^gamma),255); % Each pixel is mapped by the gamma value and a new double image is created.
I_Gray_gamma = min(c*(I_Gray_double.^gamma),255); % Each pixel is mapped by the gamma value and a new double image is created.
figure; imshow(I_gamma); title('Gamma Corrected Image');
% Image is saved in uint8 format eventhough it was double
imwrite(I_double,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Gamma_Correction\im01small_gamma.png');
figure; imshow(I_Gray_gamma); title('Gamma Corrected Gray Image');
% Image is saved in uint8 format eventhough it was double
imwrite(I_double,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Gamma_Correction\im01small_gamma_gray.png');