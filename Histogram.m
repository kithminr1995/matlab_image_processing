clear;
close all; %Reading an image from a .png file into a 3D array (for colour images or 3D array for grayscale images)
I = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\a01images\im03small.png');
figure;
imshow(I);
title('Original Image');

[m,n,c] = size(I); %Get the size of the 3-plane colour image
num_bins = 255; %Define 255 different pixel values (8 bit)
for i = 1:c
    cum_hist_in = zeros(num_bins+1,1); %Define a vector of zeros
    for j = 1:num_bins+1
        cum_hist_in(j) = sum(sum(I(:,:,i)<j)); %Calculate cumulative No. of pixels
    end
    cum_hist_prob = uint8(cum_hist_in*num_bins/(m*n));%Histogram equalize and round down
    I_t = mat2gray(cum_hist_prob(I+1));
    I_eq(:,:,i) = I_t(:,:,i); %Histogram equalized colour image is obtained
end
figure;
imshow(I_eq);
title('Histogram Equalization');
imwrite(I_eq,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Histogram\im03small_histeq.png');
figure;
imhist(rgb2gray(uint8(I_eq.*255)));

I_Gray = rgb2gray(I);
figure;
imshow(I_Gray);
title('Original Grayscale Image');
figure;
imhist(I_Gray);
imwrite(I_Gray,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Histogram\im03small_gray.png');

cum_hist_in = zeros(num_bins+1,1);
for j = 1:num_bins+1
    cum_hist_in(j) = sum(sum(I_Gray<j));
end
cum_hist_prob = uint8(cum_hist_in*num_bins/(m*n));
I_Gray_HistoEq = mat2gray(cum_hist_prob(I_Gray+1));
figure;
imshow(I_Gray_HistoEq);
title('GrayScale Histogram Equalization');
figure;
imhist(I_Gray_HistoEq);
imwrite(I_Gray_HistoEq,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Histogram\im03small_gray_histo_eq.png');

I_Gray_HistEq = histeq(I_Gray);
figure;
imshow(I_Gray_HistEq);
title('GrayScale histeq Equalization');
figure;
imhist(I_Gray_HistEq);
imwrite(I_Gray_HistEq,'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Histogram\im03small_gray_histeq.png');

