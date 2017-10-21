close all;
clear all;

I = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\a02images\eight.tif');
figure, imshow(I), title('Original Image');
I_double = im2double(I);

I_sobel = edge(I,'sobel');
I_canny = edge(I,'canny');
figure,imshowpair(I_sobel,I_canny,'montage'),title('Sobel Filter                                                            Canny Filter');

imwrite(I,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\canny edge detection\original.jpg');
imwrite(I_sobel,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\canny edge detection\sobel.jpg');
imwrite(I_canny,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\canny edge detection\canny.jpg');

I_2 = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 2\a02images\lena.png');
figure, imshow(I_2), title('Original Image');
I_2 = rgb2gray(I_2);
I_double_2 = im2double(I_2);

sigma=2; %The sigma value of the gaussian kernel decides the bluriness
h_w=7; %The half width of the filter kernel
[x,y]=meshgrid([-h_w:h_w]',[-h_w:h_w]');
g = (-1/((2*pi)*sigma^4))*exp(-(x.^2 + y.^2)/(2*sigma^2)); %creating the 2D gaussian
g_X = x.*g; %Calculate the x direction gradient
g_Y = y.*g; %Calculate the y direction gradient
%Convolution of the image with gaussian smoothed kernels
I_gaussX = conv2(I_double_2,g_X);
I_gaussY = conv2(I_double_2,g_Y);
I_gradient_Mag = sqrt(I_gaussX.^2+I_gaussY.^2);
I_gradient_theta = atan(I_gaussY/I_gaussX);
figure,imshow(mat2gray(I_gradient_Mag)),title('Magnitude of the Gradient');

I_grad_mag_max = max(I_gradient_Mag(:));
if I_grad_mag_max > 0
    I_gradient_Mag = I_gradient_Mag / I_grad_mag_max;
end
[i, j] = size(I_gradient_Mag);

num_bins = 64; %Define 64 different pixel values (8 bit)
cum_hist_in = imhist(I_gradient_Mag,num_bins);
highThresh = find(cumsum(cum_hist_in) > 0.7*i*j,1,'first') / 64;
lowThresh = find(cumsum(cum_hist_in) < 0.3*i*j,1,'first') / 64;

H = imhmax(I_gradient_Mag,highThresh);
H = imhmin(I_gradient_Mag,lowThresh);

figure,imshow(mat2gray(H)),title('Canny');

function[] = nonmaxsup(imcor,im,windx,windy,threshold)

title ('Thresholded Detection with Non Maximal Suppression')
[x,y] = size(imcor);
xblocks = floor(linspace(1,x,floor(x/windx)+1));
yblocks = floor(linspace(1,y,floor(y/windy)+1));

for i = xblocks(1:end-1)
    for j = yblocks(1:end-1)
        maxx = 0;
        mi = i;
        mj = j;
        for k = 1:1:windx
            for m = 1:1:windy
                p = imcor(i+k,j+m);
                if p >= maxx
                    maxx = p;
                    mi = i+k;
                    mj = j+m;

        if maxx>= threshold
            hold on 
              plot(mj,mi,'sr', 'MarkerSize',max(windx,windy),'LineWidth',1.5);

