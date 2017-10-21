clear;
close all; %Reading an image from a .png file into a 3D array (for colour images or 3D array for grayscale images)
I = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\a01images\im07small.png');
figure;
imshow(I);
title('Original Image');
I = rgb2gray(I);
imwrite(I,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Intensity\im06small.png');

in = input('Enter lower and upper limits of the intensity window of the input image [low_in high_in]:');
%in = [min(min(I)) max(max(I))]
out = input('Enter the minimum and maximum intensity value of the output image [low_out high_out]:');
in_range = in(2)-in(1); %input range
out_range = uint8(linspace(out(1),out(2),in_range)); %output ranged mapped to input range
[m n] = size(I);
for i = 1:1:m
    for j=1:1:n
        k = I(i,j);
        if k>=in(1) && k<=in(2)
            I_IW(i,j) = out_range(uint8(double(k)/256*in_range));
        else
            I_IW(i,j) = I(i,j);
        end
    end
end
figure;
imshow(I_IW);
title('Image Windowing');
imwrite(I_IW,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Intensity\im06small_IW.png');

I_IW_Mat = imadjust(I,in,out);
figure;
imshow(I_IW_Mat);
title('Image Windowing using MatLab');
imwrite(I_IW_Mat,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Intensity\im06small_IWmat.png');
