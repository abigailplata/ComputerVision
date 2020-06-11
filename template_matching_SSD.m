function [output, match] = template_matching_SSD(img, template, threshold)

    output = img;
    %% your code here
    
    
    %% threshold
    match = (output < threshold);
    
end