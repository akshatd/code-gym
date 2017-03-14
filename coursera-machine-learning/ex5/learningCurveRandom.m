function [error_train, error_val] = ...
    learningCurveRandom(X, y, Xval, yval, lambda)

  iterations = 50;
  m = size(X, 1);
  m_val = size(Xval, 1);
  
  error_train = zeros(m, 1);
  error_val   = zeros(m, 1);

  error_train_temp = zeros(iterations, 1);
  error_val_temp   = zeros(iterations, 1);

  for i=1:m
    for n=1:iterations
      % randomly choose i examples from the training set and train
      index_train = randperm(m);
      X_subset = X(index_train(1:i), :);
      y_subset = y(index_train(1:i));
      index_val = randperm(m_val);
      Xval_subset = Xval(index_val(1:i), :);
      yval_subset = yval(index_val(1:i));
      % use theta to compute errors for training and validation set
      theta = trainLinearReg(X_subset, y_subset, lambda);
      % get training subset error with lambda 0 as we dont wanna see regularised values
      [error_train_temp(n), g_train] = linearRegCostFunction(X_subset, y_subset, theta, 0);
      [error_val_temp(n), g_val] = linearRegCostFunction(Xval_subset, yval_subset, theta, 0);
     end
    % average over all 50 examples, to get errors for that h
    error_train(i) = mean(error_train_temp);
    error_val(i) = mean(error_val_temp);
  end    
end
    