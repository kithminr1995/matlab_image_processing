clear;
close all; %Reading an image from a .png file into a 3D array (for colour images or 3D array for grayscale images)
I = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\a01images\im04small.png');
I_big = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\a01images\im04.png');
figure;
imshow(I);
title('Original Image');

factor = input('Input scale factor intween 0-10: ');
%Checking zooming using nearest neighbour interpolation
I_zoomed_NN = Zoom(I,1,factor);
size(I_big); size(I_zoomed_NN);
ssd_NN=sum(sum(sum((I_big-I_zoomed_NN).*(I_big-I_zoomed_NN)))) %Computing SSD for scale factor of 4.

I_zoomed_BL = Zoom(I,2,factor);
I_zoomed_BL = cast(I_zoomed_BL,'uint8');
size(I_big); size(I_zoomed_BL);
[m n c] = size(I_zoomed_BL);
I_big_2 = zeros(m,n,c);
for i = 1:1:m
    for j = 1:1:n
        I_big_2(i,j,:)=I_big(i,j,:);
    end
end
ssd_BL=sum(sum(sum((uint8(I_big_2)-I_zoomed_BL).*(uint8(I_big_2)-I_zoomed_BL)))) %Computing SSD for scale factor of 4.

%figure, imshow(I), title('Original Image');
%figure, imshow(I_zoomed_BL), title('Zoomed Image BL');
%figure, imshow(I_zoomed_NN), title('Zoomed Image NN');
imwrite(I_zoomed_BL, 'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Zoom\im02small_zoombl.png')
imwrite(I_zoomed_NN, 'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Zoom\im02small_zoomnn.png')
