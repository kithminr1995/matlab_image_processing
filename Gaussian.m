clear;
close all; %Reading an image from a .png file into a 3D array (for colour images or 3D array for grayscale images)
I = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\a01images\im06small.png');
figure;
imshow(I);
title('Original Image');

sigma=2; %The sigma value of the gaussian kernel decides the bluriness
h_w=5; %The half with of the filter kernel
[i,j]=meshgrid([-h_w:h_w]',[-h_w:h_w]');
g = 1/(2*pi*sigma^2)*exp(-(i.^2 + j.^2)/(2*sigma^2)); %creating the 2D gaussian
figure;
surf(g); 
gray_g = mat2gray(g);
figure;
imshow(gray_g);

[m,n,c] = size(I);
I_double = im2double(I);
I_gauss_t = zeros(m,n);

%I_Gray = rgb2gray(I);
for k=1:c %Applying the fiter kernel to all the 3 planes of the image
    for i=1+h_w:1:m-h_w
        for j=1+h_w:1:n-h_w
            I_gauss_t(i,j)=sum(sum(I_double(i-h_w:i+h_w,j-h_w:j+h_w,k).*g));
        end
    end
    I_gauss(:,:,k)=I_gauss_t(:,:,1); %Obtaining the colour image
end
I_filter_gauss = imfilter(I,g,0,'full'); %Using the matlab filter function with gaussian kernel
figure;
imshow(I_gauss);
figure;
imshow(imfilter(I,g,0,'full'));
% imwrite(I_double, 'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Gaussian\im06small_original.png')
% imwrite(mat2gray(I_gauss), 'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Gaussian\im06small_gaussian.png')
% imwrite(gray_g, 'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Gaussian\GaussDot.png')
% imwrite(imfilter(I,g,0,'full'), 'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Gaussian\im06small_imfilter.png')
% 

