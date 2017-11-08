n = 25;
data1 = normrnd(0,1,[n 2]);
data2 = normrnd(5,1,[n 2]);
xdata = [data1;data2];
n = size(xdata,1);
names = [];
for i=1:(size(xdata)/2)
    names(i) = 1;
end
for i=(size(xdata)/2)+1:size(xdata)
    names(i) = -1;
end
names = names.';
TRAINDATA= [xdata names];
% Find the number of examples and attributes used in the data
numOfExamples = size(TRAINDATA,1)
numOfAttributes = size(TRAINDATA,2)-1
% Extract the attribute matrix X and label vector Y
X = TRAINDATA(:,1:numOfAttributes)
Y = TRAINDATA(:,numOfAttributes+1)
% Split the data into no and yes play days
X_YES_DAYS = X(find(Y==1),:)
X_NO_DAYS = X(find(Y==-1),:)
hold on
% Plot the yes days
plot(X_YES_DAYS(:,1),X_YES_DAYS(:,2),'or')
% Plot the no days
plot(X_NO_DAYS(:,1),X_NO_DAYS(:,2),'+b')
%%% Code to find the SVM hyperplane will go here! %%%%
H=eye(numOfAttributes+1)
H(numOfAttributes+1,numOfAttributes+1)=0
f=zeros(numOfAttributes+1,1)
Z = [X ones(numOfExamples,1)]
%%%%%%%%%%In linear case there should be 
%%%%%%%%%%A=-diag(Y)*Z 
%%%%%%%%%%but because I use nonlinear kernel then I change A to
dotproduct = (-diag(Y)*Z);
A = dotproduct.*(1 + dotproduct); 
c=-1*ones(numOfExamples,1);
w=quadprog(H,f,A,c);
%%% Code to plot the SVM separating hyperplane will go here! %%%%
X1= xdata;
w1=w(1,1);
w2=w(2,1);
b=w(3,1);
%%%%%%%%%%In linear case there should be 
%%%%%%%%%%Y1=-(w1*X1+b)/w2;
%%%%%%%%%%but because I use nonlinear kernel then I change A to
dotproduct = (w1*X1);
A = dotproduct.*(1 + dotproduct); 
Y1=-(A+b)/w2; %Seperating hyperplane
surf(Y1);