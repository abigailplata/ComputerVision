
img = im2double(imread('cameraman.jpg'));

sigma = 2.0;
hsize = 7;
scale = 5;


%% Gaussian Pyramid
I = img;
for s = 1:scale
    
    % Gaussian filtering
    
    % Save or show image
    imwrite(I, sprintf('Gaussian_scale%d.jpg', s)); % change I to the output of Gaussian filter
    
    % Down-sampling
    
end


%% Laplacian Pyramid
I = img;
for s = 1:scale
    
    % Gaussian filtering
    
    % Laplacian filtering
    
    % Save or show image
    imwrite(I + 0.5, sprintf('Laplacian_scale%d.jpg', s)); % change I to the output of Laplacian filter

    % Down-sampling
    
end
