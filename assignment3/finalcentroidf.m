function [ final_centroid ] = finalcentroidf( data_matrix )
%FINALCENTROIDF Summary of this function goes here
%   Detailed explanation goes here

% menghitung jumlah atribut
jumlahAtribut = size(data_matrix,2)-1;
data_kelas = data_matrix(:,jumlahAtribut+1);

%  mencari data dengan kelas tertentu
dt = data_matrix(:,1:jumlahAtribut+1);

dt_A = dt(find(data_kelas==1),:);
dt_B = dt(find(data_kelas==2),:);
dt_C = dt(find(data_kelas==3),:);

fc_A = sum(dt_A)/size(dt_A,1);
fc_B = sum(dt_B)/size(dt_B,1);
fc_C = sum(dt_C)/size(dt_C,1);

final_centroid = [fc_A; fc_B; fc_C];
end

