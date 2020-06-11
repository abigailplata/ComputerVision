img = im2double(rgb2gray(imread('cameraman.jpg')));

%% compute gradient magnitude and orientation with Sobel filter
[magnitude, orientation] = sobel_feature(img);

figure, imshow(magnitude); title('Gradient Magnitude');
figure, imagesc(orientation); colormap jet; axis image; colorbar; title('Gradient Orientation');

imwrite(magnitude, 'cameraman_sobel_magnitude.jpg');
h = gcf; saveas(h, 'cameraman_sobel_orientation.jpg');


%% apply thresholding to detect edge
threshold = 0.3;
e = magnitude > threshold;
figure, imshow(e); title(sprintf('Detected edge (threshold = %s)', num2str(threshold)));

imwrite(e, sprintf('cameraman_edge_threshold_%s.jpg', num2str(threshold)));


%% use built-in function to detect edge
e1 = edge(img, 'sobel'); % change img to sobel edge detection
e2 = edge(img, 'canny'); % change img to canny edge detection

figure, imshow(e1); title('Sobel Edge');
figure, imshow(e2); title('Canny Edge');

imwrite(e1, 'cameraman_sobel_edge.jpg');
imwrite(e2, 'cameraman_canny_edge.jpg');
