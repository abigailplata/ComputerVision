load('att_face.mat');

k = 40; % number of eigenfaces

h = size(face_training, 1);
w = size(face_training, 2);
n_train = size(face_training, 3);
n_test = size(face_testing, 3);

fprintf('Compute eigenface...\n');
%% reshape face_training from h x w x num_train to (h*w) x num_train
X = reshape(face_training, (h*w), n_train);

%% compute mean face
x_bar = mean(X,2);

%% substract mean from X
Y = X - repmat(x_bar, 1, n_train);

%% compute covariance matrix C
C = Y * Y.';

%% singular value decomposition
[U, S, D] = svd(C);

%% select the first k column from U
U = U(: , 1:k);

%% encode face image as coefficients of eigenface
fprintf('Face reconstruction...\n');
x = face_training(:, :, 1);
figure(1), 
subplot(1, 2, 1); imshow(imresize(x, 4)); title('input');

% TODO: compute coef
x = x(:);
coef = U' * (x - x_bar);

%% reconstruct face image from coefficients
x_rec = x_bar + (U*coef);

x_rec = reshape(x_rec, h, w);
subplot(1, 2, 2); imshow(imresize(x_rec, 4)); title('reconstruction');
imwrite(imresize(x_rec, 4), sprintf('reconstruct_k%d.jpg', k));

%% encode all training data
fprintf('Convert training data to coef...\n');
coef_train = U' * Y; % TODO: compute coef_train for all training images

% for i = 1:n_train
%     
%     x = face_training(:, :, i);
%     figure(1), 
%     subplot(1, 2, 1); imshow(imresize(x, 4)); title('input');
% 
%     % TODO: compute coef
%     x = x(:);
%     coef = U' * (x - x_bar);
% 
% 
%     %% reconstruct face image from coefficients
%     x_rec = x_bar + (U*coef);
% 
%     x_rec = reshape(x_rec, h, w);
%     subplot(1, 2, 2); imshow(imresize(x_rec, 4)); title('reconstruction');
%     imwrite(imresize(x_rec, 4), sprintf('reconstruct_k%d.jpg', k));
% 
% end


%% Face recognition with eigenface coefficients
fprintf('Testing...\n');
id_predict = zeros(size(id_testing));

for i = 1:n_test
    
    %% extract testing image
    img_test = face_testing(:, :, i);
    
    %% convert testing image to feature vector
    img_test = img_test(:) - x_bar;
    coef_test = U' * img_test;  % TODO: replace this line
    
    error = zeros(n_train, 1);
    for j = 1:n_train
        
        %% compute the square error between feature vectors
        diff = coef_train(:, j) - coef_test;
        error(j) = sum( diff .^2 );
        
    end
    
    %% find the image id with minimal error
    [~, min_id] = min(error);
    id_predict(i) = min_id;
    
end

%% compute accuracy
accuracy = sum(id_testing == id_predict)/n_test;
fprintf('Accuracy = %f\n', accuracy);

%---------------------------------------%
%---------- Fill in this table ---------%
%---------------------------------------%
%   k   |  Accuracy
%---------------------------------------%
%  10   | 0.675000 
%---------------------------------------%
%  20   | 0.687500
%---------------------------------------%
%  30   | 0.718750
%---------------------------------------%
%  40   | 0.737500
%---------------------------------------%
%  50   | 0.737500
%---------------------------------------%


