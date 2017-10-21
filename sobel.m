close all;
clear all;

I = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\a02_DIP3E_Original_Images_CH09\Fig0905(a)(wirebond-mask).tif');
figure, imshow(I), title('Original Image');
%I = rgb2gray(I);
I_double = im2double(I);
sobel_Mx = [-1 -2 -1;0 0 0;1 2 1]; %Sobel kernel x-direction
sobel_My = [-1 0 1;-2 0 2;-1 0 1]; %Sobel kernel y-direction
%sobel_45 = [-2 -1 0;-1 0 1;0 1 2];
sobel_45 = sobel_Mx*cos(pi/4) + sobel_My*sin(pi/4); %Sobel kernel 45-deg
%Convolution of the image with sobel kernels
I_sobelx = conv2(I_double,sobel_Mx);
I_sobely = conv2(I_double,sobel_My);
I_sobel45 = conv2(I_double,sobel_45);
I_gradient_Mag = sqrt(I_sobelx.^2+I_sobely.^2);

figure, imshow(I_double), title('Gray Image')
figure, imshow(mat2gray(I_sobelx)), title('X Direction Gradient')
figure, imshow(mat2gray(I_sobely)), title('Y Direction Gradient')
figure, imshow(mat2gray(I_sobel45)), title('45 Degree Gradiant')
figure, imshow(mat2gray(I_gradient_Mag)), title('Gradient Magnitude')

imwrite(I,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\image gradients\sobel smooth\original.jpg');
imwrite(mat2gray(I_sobelx),'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\image gradients\sobel smooth\ox.jpg');
imwrite(mat2gray(I_sobely),'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\image gradients\sobel smooth\oy.jpg');
imwrite(mat2gray(I_sobel45),'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\image gradients\sobel smooth\o45.jpg');
imwrite(mat2gray(I_gradient_Mag),'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\image gradients\sobel smooth\ogradmag.jpg');


