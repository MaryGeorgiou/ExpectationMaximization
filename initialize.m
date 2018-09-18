function [M,S,P] = initialize(k,X)
%initializes the EM values
indices=randperm(size(X,1));
M=X(indices(1:k),:);
S=ones(k,1)*var(X)*0.1;
P=ones(1,k);
P=P/k;
end

