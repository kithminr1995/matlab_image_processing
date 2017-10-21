close all;
clear all;
a = rgb2gray(imread('E:\Semester FOUR\Adhitha\EN2550 - Image Processing and Machine Vision\Assignments\Assignment2\a1.jpg'));
[rows, cols] = size(a);
fx = [-1 -2 -1;0 0 0;1 2 1];
fy = [-1 0 1;-2 0 2;-1 0 1];
%% creating gradient matrices
ax = filter2(fx,a);
ay = filter2(fy,a);

axx = ax.^2;
ayy = ay.^2;
axy = ax.*ay;
%% creating gaussian kernel
sigma = 2;
half = 2;
[gx,gy] = meshgrid(-half:half,-half:half);
gauss2 = exp((-1)*(gx.^2+gy.^2)/(2*sigma^2))/(2*pi*sigma^2); 
gauss = gauss2;
%% computing R by creating M matrix to every pixel
i = 1;
j = 1;
k = 1;
l = 1;
allR = zeros(rows-(half*2), cols-(half*2));
[rowsR, colsR] = size(allR);

for x = (1+half):(rows-half)
    for y = (1+half):(cols-half)
        M = zeros(2,2);
        for m = -half:half
            for n = -half:half
                M(1,1) = M(1,1) + gauss(k,l)*axx(x+m,y+n);
                M(1,2) = M(1,2) + gauss(k,l)*axy(x+m,y+n);
                M(2,1) = M(2,1) + gauss(k,l)*axy(x+m,y+n);
                M(2,2) = M(2,2) + gauss(k,l)*ayy(x+m,y+n);
                l = l+1;
            end
            l = 1;
            k = k+1;
        end
        allR(i,j) = (M(1,1)*M(2,2) - M(1,2)*M(2,1)) - 0.04*(M(1,1)+M(2,2))^2; 
        k = 1;
        j = j+1;
    end
    j = 1;
    i = i+1;
end
i = 1;
check = allR;

%% Puting a threshold value and nonmaximum suppression

figure,surf(allR),shading flat; 

for x = 1:rowsR
    for y = 1:colsR
        if allR(x,y)> 100000
            allR(x,y) = 255;
        else
            allR(x,y) = 0;
        end
    end
end

figure, imshow(allR);
figure, imshow(a);