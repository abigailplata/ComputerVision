%%%%%%% #1 %%%%%%%%%
img1 = imread('01.jpg'); %set variable img1 to 01.jpg

redOnly = img1(:,:,1); %red channel
greenOnly = img1(:,:,2); %green channel
blueOnly = img1(:,:,3); %blue channel
blackOnly = zeros(size(img1,1),size(img1, 2), 'uint8'); %matrix of zeros (aka black channel) of size img1 (x,y)

redImage = cat(3,blackOnly,greenOnly,blueOnly); %create red image by showing (red, black, black) of (r,g,b) and set equal to variable called redImage

imwrite(redImage, 'red.jpg');
figure, imshow(redImage); %display resulting image

%%%%%%% #2 %%%%%%%%%
img2 = imread('02.jpg');

redOnly = img2(:,:,1);
greenOnly = img2(:,:,2);
blueOnly = img2(:,:,3);

grayImage = (0.229*redOnly) + (0.587*greenOnly) + (0.114*blueOnly); %apply equation to each channel to get grayscale and set equal to var called grayImage

imwrite(grayImage, 'gray.jpg');
figure, imshow(grayImage); %display grayscale image

%%%%%%% #3 %%%%%%%%%
img3 = imread('03.jpg');
rotated = imrotate(img3, 90); %rotate image 90 degrees and set equal to variable called rotated

imwrite(rotated, 'rotate.jpg');
figure, imshow(rotated); %display rotated image

%%%%%%% #4 %%%%%%%%%
img4 = imread('04.jpg');
cropped = img4(15:285,15:385,:); %crop image specifying the parameters for how the image should be cropped
imwrite(cropped, 'crop.jpg');
figure, imshow(cropped); %display cropped image

%%%%%%% #5 %%%%%%%%%
img4 = imread('04.jpg');
flipped = flip(img4); %flip vertically, set equal to variable named flipped
imwrite(flipped, 'flip.jpg');
figure, imshow(flipped); %display flipped image

%%%%%%% #6 %%%%%%%%%
I = imread('04.jpg');
I = I(:); %turn image I into a vector
I2 = imread('flip.jpg');
I2 = I2(:); %turn image I2 into a vector

avgImg = (I+I2)/2; %take the average of the two vectors, set equal to variable named avgImg
avgImg = reshape(avgImg, 300, 400, 3); %use the reshape function to reshape the vector avgImg back into an image of size 300x400x3

imwrite(avgImg, 'average.jpg');
figure, imshow(avgImg); %display averaged image

%%%%%%% #7 %%%%%%%%%
canvas = zeros(300*2+15,400*2+15,3,'uint8'); %create a matrix of zeros (empty matrix) of size (300*2+10 x 400*2+10 x 3) aka a 610 x 810 matrix
                                             %for all 4 images, with 10 pixel spacing, set equal to variable named canvas

canvas(1:300,1:400,:) = img1; %set img1 to be in the top (1:300) left (1:400) corner of the empty matrix called canvas
canvas(1:300,416:815,:) = img2; %set img2 to be in the top (1:300) right (416:815) corner
canvas(316:615, 1:400, :) = img3; %set img3 to be in the bottom (316:615) left (1:400) corner
canvas(316:615,416:815,:) = img4; %set img4 to be in the bottom (316:615) right (416:815) corner

imwrite(canvas, 'combine.jpg');
figure, imshow(canvas); %display combined image



