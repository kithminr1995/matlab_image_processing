close all;
clear all;

I = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\a02_DIP3E_Original_Images_CH09\Fig0905(a)(wirebond-mask).tif');
figure, imshow(I), title('Original Image');
%I = rgb2gray(I);
I_double = im2double(I);

sigma=2; %The sigma value of the gaussian kernel decides the bluriness
h_w=5; %The half width of the filter kernel
[x,y]=meshgrid([-h_w:h_w]',[-h_w:h_w]');
% sobel_Mx = [-1 -2 -1;0 0 0;1 2 1]; %Sobel kernel x-direction
% sobel_My = [-1 0 1;-2 0 2;-1 0 1]; %Sobel kernel y-direction
% x = sobel_Mx;
% y = sobel_My;
g = (-1/((2*pi)*sigma^4))*exp(-(x.^2 + y.^2)/(2*sigma^2)); %creating the 2D gaussian derivative
g_X = x.*g; %Calculate the x direction gradient
figure,surf(x,y,g_X),title('Derivative of Gaussian Filter in X direction'); 
g_Y = y.*g; %Calculate the y direction gradient
figure,surf(x,y,g_Y),title('Derivative of Gaussian Filter in Y direction');
figure,imshowpair(g_X,g_Y,'montage');
g_45 = g_X*cos(pi/4) + g_Y*sin(pi/4);% Calculate the 45 degree gradient matrix

%Convolution of the image with gaussian smoothed kernels
I_gaussx = conv2(I_double,g_X);
I_gaussy = conv2(I_double,g_Y);
I_gauss45 = conv2(I_double,g_45);
I_gradient_Mag = sqrt(I_gaussx.^2+I_gaussy.^2);

figure, imshow(I_double), title('Gray Image')
figure, imshow(mat2gray(I_gaussx)), title('X Direction Gradient')
figure, imshow(mat2gray(I_gaussy)), title('Y Direction Gradient')
figure, imshow(mat2gray(I_gauss45)), title('45 Degree Gradiant')
figure, imshow(mat2gray(I_gradient_Mag)), title('Gradient Magnitude')

imwrite(I,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\image gradients\gaussian smooth kernel\original.jpg');
imwrite(mat2gray(I_gaussx),'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\image gradients\gaussian smooth kernel\ox.jpg');
imwrite(mat2gray(I_gaussy),'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\image gradients\gaussian smooth kernel\oy.jpg');
imwrite(mat2gray(I_gauss45),'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\image gradients\gaussian smooth kernel\o45.jpg');
imwrite(mat2gray(I_gradient_Mag),'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\image gradients\gaussian smooth kernel\ogradmag.jpg');
