function decbound2D(X1,X2,classifier)

% X1 is vector contains all values of 1st attribute, 
% X2 is vector contains all values of 2nd attribute, 
% classifier is an abstract of odel of your classifier. You may extend it 
% to more than one variable following your classifier design. For example, 
% when you use Naive Bayes classifier then you may replace 'classifier' 
% above by two variables, namely 'prior' and 'likelihood'

% Original author: Peter Yu, http://www.peteryu.ca/tutorials/matlab/visualize_decision_boundaries
% modified by milo.
data_train = [X1 X2 classifier];

% set up the domain over which you want to visualize the decision
% boundary
xrange = [min(X1) max(X1)];
yrange = [min(X2) max(X2)];

% interval how finely you want to visualize the decision boundary.
interval = 0.1;
 
% generate grid coordinates for the basis of decision boundary visualization.
[x, y] = meshgrid(xrange(1):interval:xrange(2), yrange(1):interval:yrange(2));
 
% size of decision boundary image for background of plot.
image_size = size(x);
 
% make (x,y) pairs as a new data point to be classified which 1st column as
% X1, 2nd column as X2
xy = [x(:) y(:)]; 


numxypairs = length(xy); % number of (x,y) pairs
  
% loop through each meshgrid points and get the predicted class
class_prediction = zeros(numxypairs,1);
for ii=1:numxypairs

  
    z=xy(ii,:);
    % classifiy each new data point xy, put here your code of classification
    % process using your classifier model. The input is each row of 'xy'.
    % Save the predicted class in 'class_prediction'. 
    % for example: 
    % when ii=1, then the input for your classifier is xy(i,:)
    % the output is saved on class_prediction(ii)       
    class_prediction(ii) = CLO19_pnn(data_train,z);
    
end
 
% reshape the idx (which contains the class label) into an image.
decisionmap = reshape(class_prediction, image_size);

figure;
 
%show the image
imagesc(xrange,yrange,decisionmap);
hold on;
set(gca,'ydir','normal');
 
% set RGB color for colormap for the classes:
cmap = [1 0.8 0.8;      % class 1 = light red
        0.95 1 0.95;    % class 2 = light green 
        0.9 0.9 1];     % class 3 = light blue
colormap(cmap);
 
% label the axes.
xlabel('x_1');
ylabel('x_2');