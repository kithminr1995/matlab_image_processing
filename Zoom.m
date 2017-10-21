function I_zoom = Zoom (I,z,f)
%This function will zoom an image of size [m,n,c] using 1)Nearest Neighbour Interpolation
%if z=1 or 2)Bilinear Interpolation if z=2 by a factor of f.
if z==1 %Nearest Neighbour Interpolation
    [m,n,c] = size(I);
    I_zoom=uint8(zeros(m*f,n*f,c));
    for i=1:1:m*f
        for j=1:1:n*f
            % Calculate the corresponding pixel in the original image and assign that value to the zoomed image
            I_zoom(i,j,:)=uint8(I(ceil(i./f),ceil(j./f),:));
        end
    end
end
if z==2 %Bilinear Interpolation
    Im=cast(I,'int16');
    %imshow(cast(Im,'uint8'));
    [m,n,c] = size(Im);
    I_zoom = zeros(m, n, c);

    for i=1:m
        for j=1:n
          I_zoom(1+(i-1)*f,1+(j-1)*f,:)=Im(i,j,:);
        end
    end
    %imshow(cast(I_zoom,'uint8'));
    %bilinear interpolation
    for i=1:1+(m-2)*f     %row number
        for j=1:1+(n-2)*f %column number
            if ((rem(i-1,f)==0) && (rem(j-1,f)==0))
            else
                h00=I_zoom( ceil(i/f)*f-f+1,ceil(j/f)*f-f+1,:);
                h10=I_zoom( ceil(i/f)*f-f+1+f,ceil(j/f)*f-f+1,:);
                h01=I_zoom( ceil(i/f)*f-f+1,ceil(j/f)*f-f+1+f,:);
                h11=I_zoom( ceil(i/f)*f-f+1+f,ceil(j/f)*f-f+1+f,:);

                x=rem(i-1,f); %coordinates of calculating pixel.
                y=rem(j-1,f);

                dx=x/f; %localizeing the  pixel being calculated to the nearest four known pixels.
                dy=y/f;

                b1=h00;    %constants of bilinear interpolation.
                b2=h10-h00;
                b3=h01-h00;
                b4=h00-h10-h01+h11;
                I_zoom(i,j,:)=b1+b2*dx+b3*dy+b4*dx*dy; %equation of bilinear interpolation.
            end
        end
    end
    %imshow(cast(I_zoom,'uint8'));
end
