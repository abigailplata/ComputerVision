function img_merged = hybrid_image(img1, img2, ratio)

    
    %% split img1 and img2 into low/high frequency maps
    [low_pass_img1, high_pass_img1] = separate_frequency(img1,ratio); %cat
    [low_pass_img2, high_pass_img2] = separate_frequency(img2,ratio); %dog
    
    
    %% combine the low-frequency map of img1 with the high-frequency map of img2
    %img_merged = low_pass_img1 + high_pass_img2; % change this line
    img_merged = low_pass_img2 + high_pass_img1;

    
end
