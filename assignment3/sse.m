function [ sseout ] = sse( data_matrix, centroid )
%SSE Summary of this function goes here
%   Detailed explanation goes here

% menghitung euclidean distance dengan centroid kelas 1
m1_x = data_matrix(:,1) - centroid(1,1);
m1_y = data_matrix(:,2) - centroid(1,2);
% m1 = [m1_x m1_y];
m1_tot = sqrt((m1_x - m1_y).^2);

% menghitung euclidean distance dengan centroid kelas 2
m2_x = data_matrix(:,1) - centroid(2,1);
m2_y = data_matrix(:,2) - centroid(2,2);
% m2 = [m2_x m2_y];
m2_tot = sqrt((m2_x - m2_y).^2);

% menghitung euclidean distance dengan centroid kelas 3
m3_x = data_matrix(:,1) - centroid(3,1);
m3_y = data_matrix(:,2) - centroid(3,2);
% m3 = [m3_x m3_y];
m3_tot = sqrt((m3_x - m3_y).^2);

% membuat matriks yang berisi hasil dari setiap euclidean distance kelas
sseout = [sum(m1_tot) sum(m2_tot) sum(m3_tot)];



end

