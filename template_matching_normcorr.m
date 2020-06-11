function [output, match] = template_matching_normcorr(img, template, threshold)
    
    output = img;
    %% your code here
    
    
    %% threshold
    match = (output > threshold);
    
end