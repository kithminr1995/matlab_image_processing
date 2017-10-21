clear;
close all; %Reading an image from a .png file into a 3D array (for colour images or 3D array for grayscale images)
I = imread('C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\a01images\im08small.png');
figure;
imshow(I);
title('Original Image');
I_2 = I;
degree = input('Degree of rotation: ');
theta = degree*pi/180;% Convert to radians
%Create transformation matrix
T = [+cos(theta) +sin(theta); -sin(theta) +cos(theta)];
switch mod(degree, 360)
    % Special cases
    case 0
        I_rotate = I;
    case 90
        I_rotate = rot90(I);
    case 180
        I_rotate = I(end:-1:1, end:-1:1);
    case 270
        I_rotate = rot90(I(end:-1:1, end:-1:1));

    % General rotations
    otherwise
        % Convert to radians and create transformation matrix
        theta = degree*pi/180;
        T = [+cos(theta) +sin(theta); -sin(theta) +cos(theta)];

        % Figure out the size of the transformed image
        [m,n,p] = size(I);
        dest = round( [1 1; 1 n; m 1; m n]*T );
        dest = bsxfun(@minus, dest, min(dest)) + 1;
        I_rotate = zeros([max(dest) p],class(I));

        % Map all pixels of the transformed image to the original image
        for ii = 1:size(I_rotate,1)
            for jj = 1:size(I_rotate,2)
                source = ([ii jj]-dest(1,:))*T.';
                if all(source >= 1) && all(source <= [m n])
                    % Get all 4 surrounding pixels
                    C = ceil(source);
                    F = floor(source);
                    % Compute the relative areas
                    A = [...
                        ((C(2)-source(2))*(C(1)-source(1))),...
                        ((source(2)-F(2))*(source(1)-F(1)));
                        ((C(2)-source(2))*(source(1)-F(1))),...
                        ((source(2)-F(2))*(C(1)-source(1)))];
                    % Extract colors and re-scale them relative to area
                    cols = bsxfun(@times, A, double(I(F(1):C(1),F(2):C(2),:)));
                    % Assign                     
                    I_rotate(ii,jj,:) = sum(sum(cols),2);
                end
            end
        end        
end

figure;
imshow(I_rotate);

figure;
imshow(imrotate(I_2,45)); %Rotating 45 degrees using the built-in function
imwrite(I_2, 'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Rotate\im.png');
imwrite(I_rotate, 'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Rotate\imagerot.png');
imwrite(imrotate(I_2,45), 'C:\Users\D I B Wickremasinghe\My Files\Semester 4\8 - Fundamentals of Image Processing and Machine Vision - 3 Credits\2015\Assignment 1\Rotate\imrotate.png');
