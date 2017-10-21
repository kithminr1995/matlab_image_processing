close all;
clear all;

I = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\median filter noisy image\a1.jpg');
I2 = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\median filter noisy image\a2.jpg');
I3 = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\median filter noisy image\a3.jpg');
figure, imshow(I), title('Original Image');
figure, imshow(I2), title('Original Image');

I_gray = rgb2gray(I);
I_gray2 = rgb2gray(I2);
I_gray3 = rgb2gray(I3);
figure, imshow(I_gray3), title('Original Image');
imwrite(I_gray3,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\median filter noisy image\ag3.jpg');
I_noise3 = imnoise(I_gray3,'salt & pepper',0.2);
figure, imshow(I_noise3), title('Original Image');
imwrite(I_noise3,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\median filter noisy image\an3.jpg');

figure,imshow(medfilt2(I_gray));
figure,imshow(medfilt2(I_gray2));
figure,imshow(medfilt2(I_noise3));
imwrite(medfilt2(I_gray),'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\median filter noisy image\aa1.jpg');
imwrite(medfilt2(I_gray2),'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\median filter noisy image\aa2.jpg');
imwrite(medfilt2(I_noise3),'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\median filter noisy image\aa3.jpg');

h_w=1; %The half width of the filter kernel
[i,j]=meshgrid([-h_w:h_w]',[-h_w:h_w]');

