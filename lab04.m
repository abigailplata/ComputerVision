close all;
%% Task 1: Split Frequency

img = im2double(imread('cameraman.jpg'));
ratio = 0.1;
[low_pass_img, high_pass_img] = separate_frequency(img, ratio);
figure,imshow(low_pass_img);
figure, imshow(high_pass_img + 0.5);

ratio2 = 0.2;
[low_pass_img2, high_pass_img2] = separate_frequency(img,ratio2);
figure, imshow(low_pass_img2);
figure, imshow(high_pass_img2 + 0.5);
%imwrite(low_pass_img, 'cameraman_low_0.1.jpg');
%imwrite(high_pass_img + 0.5, 'cameraman_high_0.1.jpg');


%% Task 2: Hybrid Image
name1 = 'cat.jpg';
name2 = 'dog.jpg';
img1 = im2double(imread(name1)); 
img2 = im2double(imread(name2));
%figure, imshow(name1);

ratio = 0.2;
img_merged = hybrid_image(img1, img2, ratio);
figure, imshow(img_merged);
img_merged2 = hybrid_image(img2, img1,ratio);
figure, imshow(img_merged2);
%imwrite(img_merged, 'hybrid_2.jpg');