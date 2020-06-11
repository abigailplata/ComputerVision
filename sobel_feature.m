function [magnitude, orientation] = sobel_feature(img)

    Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
    Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
    
    %% Sobel filtering
    xGrad = imfilter(img, Hx);
    yGrad = imfilter(img, Hy);
    
    %% compute gradient magnitude and orientation
    magnitude = (xGrad.^2 + yGrad.^2) .^0.5; % change img to your gradient magnitude
    orientation = atan2(yGrad, xGrad); % change img to your gradient orientation
end
