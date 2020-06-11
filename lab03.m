
img1 = im2double(imread('lena_noisy.jpg'));
img2 = im2double(imread('lena.jpg'));

%% Median filter
I1 = median_filter(img1, [3,3]);
figure, imshow(I1);
imwrite(I1, 'median_3.jpg');

I2 = median_filter(img1, [5,5]);
figure, imshow(I2);
imwrite(I2, 'median_5.jpg');


%% Sobel filter
S1 = sobel_filter(img2, [1, 2, 1; 0, 0, 0; -1, -2, -1]);
figure, imshow(S1);
imwrite(S1, 'sobel_h.jpg');
% 1, 2, 1; 0, 0, 0; -1, -2, -1 <- horizontal edge

S2 = sobel_filter(img2, [1, 0, -1; 2, 0, -2; 1, 0, -1]);
figure, imshow(S2);
imwrite(S2, 'sobel_v.jpg');
% 1, 0, -1; 2, 0, -2; 1, 0, -1 <- vertical edge

%% Gaussian filter
G1 = gaussian_filter(img2, 5, 2);
figure, imshow(G1);
imwrite(G1, 'gaussian_5.jpg');
% hsize = 5 sigma = 2

G2 = gaussian_filter(img2, 9, 4);
figure, imshow(G2);
imwrite(G2, 'gaussian_9.jpg');
% hsize = 9 sigma = 4
