function [corner_x, corner_y] = Harris_corner_detector...
                                    (I, sigma1, sigma2, alpha, R_threshold)
    
	%% Gaussian kernels
    hsize1 = 1 + 2 * ceil(sigma1 * 2);
    hsize2 = 1 + 2 * ceil(sigma2 * 2);

    gaussian_kernel1 = fspecial('gaussian', hsize1, sigma1);
    gaussian_kernel2 = fspecial('gaussian', hsize2, sigma2);

    
    %% derivative filter
    Dx = [1, 0, -1];
    Dy = [1; 0; -1];
    Gx = imfilter(I,gaussian_kernel1);
    Gy = imfilter(I,gaussian_kernel1);
    
    
    %% Use derivative of Gaussian to compute x-gradient (Ix) and y-gradient (Iy)
    Ix = imfilter(Gx,Dx);
    Iy = imfilter(Gy,Dy);

    %figure, imshow(Ix + 0.5);
    %figure, imshow(Iy + 0.5);



    %% compute Ixx, Iyy, Ixy
    Ixx = Ix .* Ix;
    Iyy = Iy .* Iy;
    Ixy = Ix .* Iy;

    
    
    %% compute Sxx, Syy, Sxy
    Sxx = imfilter(Ixx,gaussian_kernel2);
    Syy = imfilter(Iyy,gaussian_kernel2);
    Sxy = imfilter(Ixy,gaussian_kernel2);

    
    
    %% compute corner response from determine and trace
    detM = (Sxx .* Syy) - (Sxy .* Sxy);
    traceM = (Sxx + Syy);
    R = detM - alpha * ((traceM).^2);

    %figure, imagesc(R); colormap jet; colorbar; axis image;

    
    
    %% find corner map with R > R_threshold
    corner_map = R > R_threshold;
    
    %figure, imshow(corner_map);

    
    
    %% find local maxima of R
    local_maxima = imregionalmax(corner_map);
    
    %figure, imshow(local_maxima)

    
    
    %% final corner map and corner x, y coordinates
    final_corner_map = corner_map & local_maxima;
    
    [corner_y, corner_x] = find(final_corner_map);


end

