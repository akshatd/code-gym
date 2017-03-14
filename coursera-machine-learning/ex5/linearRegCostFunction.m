function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.

% cost
A = X*theta-y;
J = 1/(2*m)*(A'*A);
% regularising
J = J+lambda/(2*m)*theta(2:end)'*theta(2:end);

% gradient
% X(:,1) is the X(1) part for all traiing examples
grad0 = X(:,1)'/m*(X*theta-y);
gradrest = X(:,2:end)'/m*(X*theta-y) + lambda/m*theta(2:end, :);
grad = [grad0; gradrest];

% =========================================================================

grad = grad(:);

end
