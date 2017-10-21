clear;
close all; %Reading an image from a .png file into a 3D array (for colour images or 3D array for grayscale images)
I = imread('C:\Users\Wickremasinghe\Moratuwa University\0.4 Fourth Semester\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\a01images\im01small.png');
figure;
imshow(I);
title('Original Image');

I_R = I;
%Generating the Red version of the image
I_R(:,:,2)=0; %Intesity of Green is set to zero
I_R(:,:,3)=0; %Intesity of Blue is set to zero
figure;
imshow(I_R);
title('Red Image');
imwrite(I_R,'C:\Users\Wickremasinghe\Moratuwa University\0.4 Fourth Semester\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\RGB\im01small_red.png');

I_G = I;
%Generating the Green version of the image
I_G(:,:,1)=0; %Intesity of Red is set to zero
I_G(:,:,3)=0; %Intesity of Blue is set to zero
figure;
imshow(I_G);
title('Green Image');
imwrite(I_G,'C:\Users\Wickremasinghe\Moratuwa University\0.4 Fourth Semester\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\RGB\im01small_green.png');

I_B = I;
%Generating the Blue version of the image
I_B(:,:,1)=0; %Intesity of Red is set to zero
I_B(:,:,2)=0; %Intesity of Green is set to zero
figure;
imshow(I_B);
title('Blue Image');
imwrite(I_B,'C:\Users\Wickremasinghe\Moratuwa University\0.4 Fourth Semester\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\RGB\im01small_blue.png');

%Generating a grayscale image of the image
I_Gray = rgb2gray(I); %Using matlab function to convert to a grayscale image
figure;
imshow(I_Gray);
title('Greyscale Image');
imwrite(I_Gray,'C:\Users\Wickremasinghe\Moratuwa University\0.4 Fourth Semester\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\RGB\im01small_grays.png');


