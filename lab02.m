%%% #1 move image vertically by 25 pixels %%%
img1 = imread('01.jpg');

img0 = zeros(300, 400, 3, 'uint8');
for j = 1:300
    for i = 1:400
        x = j+25;
        y = i;
        
        img0(x, y, :) = img1(j,i,:);
    end
end

figure, imshow(img0);
imwrite(img0, 'translate.jpg');

%%% #2 rotate image by 60 degrees with forward warping %%%
canvas = zeros(300, 400, 3, 'uint8');
midx = ceil((size(img1,1)+1)/2);
midy = ceil((size(img1,2)+1)/2);

deg = 60;
rad = 2*pi*deg/360;

for i = 1:size(canvas, 1)
    for j = 1:size(canvas,2)
        x = (i-midx)*cos(-rad) + (j-midy)*sin(-rad);
        y = -(i-midx)*sin(-rad) + (j-midy)*cos(-rad);
        x = round(x)+midx;
        y = round(y)+midy;
        
        if (x>=1 && y>=1 && x<=size(img1,1) && y<=size(img1,2))
            canvas(x,y,:) = img1(i,j,:);
        end
    end
end

figure, imshow(canvas);
imwrite(canvas,'rotateF.jpg');
        
%%% #3 rotate image by 60 degrees with backward warping %%%
canvas2 = zeros(300, 400, 3, 'uint8');
midx = ceil((size(img1,1)+1)/2);
midy = ceil((size(img1,2)+1)/2);

deg = 60;
rad = 2*pi*deg/360;

for i = 1:size(canvas2, 1)
    for j = 1:size(canvas2,2)
        x = (i-midx)*cos(rad) + (j-midy)*sin(rad);
        y = -(i-midx)*sin(rad) + (j-midy)*cos(rad);
        x = round(x)+midx;
        y = round(y)+midy;
        
        if (x>=1 && y>=1 && x<=size(img1,1) && y<=size(img1,2))
            canvas2(i,j,:) = img1(x,y,:);
        end
    end
end

figure, imshow(canvas2);
imwrite(canvas2, 'rotateB.jpg');

%%% #4 flip image vertically %%%

upsideDown = zeros(300,400,3,'uint8');
for k = 1:300
    upsideDown(k,:) = img1(300-k+1,:);
end


figure, imshow(upsideDown);
imwrite(upsideDown, 'flip.jpg');

%%% #5 scale image by 1/2 %%%
rows = 300;
cols = 400;
I2 = zeros(rows/2, cols/2, 3, 'uint8');
scale_width = (cols * 1.0) / (cols/2);
scale_height = (rows * 1.0) / (rows/2);
for row = 1:rows/2
    for col = 1:cols/2
        x = round(row * scale_height);
        y = round(col * scale_width);
        I2(row,col,:) = img1(x,y,:);
    end
end
figure, imshow(I2);
imwrite(I2, 'scale.jpg');
