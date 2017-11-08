data = csvread('non-linear_7.csv');

jumlahContoh = size(data,1);
jumlahAtribut = size(data,2) - 1;
X = data(:,1:jumlahAtribut);
data_kelas = data(:,jumlahAtribut+1);

X3 = polynomial_kernel(X(:,1),X(:,2));


X_A = X(find(data_kelas==1),:);
X_B = X(find(data_kelas==-1),:);

X3_A = X3(find(data_kelas==1),:);
X3_B = X3(find(data_kelas==-1),:);

figure
hold on
scatter(X_A(:,1),X_A(:,2),'+b');
scatter(X_B(:,1),X_B(:,2),'o','r');

figure
scatter3(X3_A(:,1),X3_A(:,2),X3_A(:,3),'+b');
hold on
scatter3(X3_B(:,1),X3_B(:,2),X3_B(:,3),'o','r');

H = eye(jumlahAtribut+1);

H(jumlahAtribut+1, jumlahAtribut+1) = 0;

f = zeros(jumlahAtribut+1,1);
Z = [X ones(jumlahContoh,1)];
A = -diag(data_kelas)*Z;
% dotproduct = (-diag(data_kelas)*Z);
% A = dotproduct.*(1 + dotproduct); 
c = -1*ones(jumlahContoh,1);

w = quadprog(H,f,A,c);

w1 = w(1,1);
w2 = w(2,1);
% w3 = w(3,1);
b = w(3,1);

X1 = [X(:,1) X(:,2)];

dotproduct = (w1.*X1);
A = dotproduct.*(1 + dotproduct);
Y1=-(A+b)/w2;

plot3(X1 , Y1 , (X1.^2 + Y1.^2));
% 
% surf(Y1);
% syms x y;
% hyper = symfun(-(w1.*[x y].*(1 + w1.*[x y])+b)/w2 , [x y]);

% syms x y;
% hyper = symfun(-(w1*[x y]+b)/w2, [x y]);
% mat = hyper(X_A(:,1),X_B(:,2));