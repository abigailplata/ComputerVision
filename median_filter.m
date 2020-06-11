function img_filtered = median_filter(img, patch_size)
output = zeros(size(img));  % make a canvas of the size
shift_a = floor(patch_size(2)/2);%shift for the matrix
shift_b = floor(patch_size(1)/2); %this is for the shifts in the matrix for patch

for a = (1+shift_a): (size(img,2)- shift_a)
    for b = (1+ shift_b): (size(img,1) - shift_b)
        x1 = a-shift_a; x2 = a + shift_a;
        y1 = b-shift_b; y2 = b + shift_b; %this is the surrounding of of (u,v)
    
       patch = img(y1:y2, x1:x2);
       patch = patch(:);
       value = median(patch);
       output(b,a) = value;


    % your code here
    
    end
end
img_filtered = output;
end