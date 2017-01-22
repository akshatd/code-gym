function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% add a column of 1, since features are in columns(5000x400)
a1 = [ones(m,1) X];
z2 = sigmoid(Theta1*a1');
% add a roe of 1, since features are in rows(25x5000)
z2 = [ones(1,m);z2];
% again no need to do sigmoid in the last step since the largest value
% will be a huge number anyway
[val, p] = max(Theta2*z2);
p=p';

% =========================================================================


end
