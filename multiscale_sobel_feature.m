function feature = multiscale_sobel_feature(img, scale)

    % initialize feature vector
    feature = [];
    
    for i = 1:scale
        
        [Gx,Gy] = imgradientxy(img);
        
        % compute sobel feature
        %f = (Gx.^2 + Gy.^2) .^0.5; % magnitude
        f = atan2(Gy, Gx); % theta
        
        % concatenate feature vector
        feature = cat(1, feature, f(:));
        
        % down-sample image by 2
        
    end
    
end