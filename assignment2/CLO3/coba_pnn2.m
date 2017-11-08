% Five data points
X = [2 ; 2.5; 3; 1; 6];
sizeTes = size(X,1);
% Sigma
sigma = 1;

x = 3;

a = -((X - x).^2./(2*sigma));
b = 1/sqrt(2*pi);
y = 1/sizeTes * sum(b * exp(a));