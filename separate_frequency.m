 function [low_pass_img, high_pass_img] = separate_frequency(img, ratio)

    %% apply FFT
    frequency_map = fft2(img);
    %figure, imshow(log(abs(frequency_map) + 1), []);
    
    
    %% shift the frequency map
    frequency_map_shifted = fftshift(frequency_map);
    %figure, imshow(frequency_map_shifted);

    %% compute low-frequency mask
    x = size(img,1); %img width
    y = size(img,2); %img height
    % create a rectangular mask whose:
    height = ratio * y;
    width = ratio * x;
    %       center of the rectangle is the center of the input image
    
    cY = y/2;
    cX = x/2;
    y1 = cY - height/2;
    x1 = cX - width/2;
    y2 = cY + height/2;
    x2 = cX + width/2;

    mask = zeros(size(img));
    mask(y1 : y2, x1 : x2, :) = 1;
    
    
    %% separate low-frequency and high-frequency maps
    low_frequency_map_shifted = frequency_map_shifted .* mask;
    high_frequency_map_shifted = frequency_map_shifted .* (1 - mask);
    
    %% shift frequency maps back
    low_frequency_map = ifftshift(low_frequency_map_shifted);
    high_frequency_map = ifftshift(high_frequency_map_shifted);
    
    %% apply Inverse FFT
    low_pass_img = real(ifft2(low_frequency_map)); % change frequency_map to your low-frequency map
    high_pass_img = real(ifft2(high_frequency_map)); % change frequency_map to your high-frequency map
    
end