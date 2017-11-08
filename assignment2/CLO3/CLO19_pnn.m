function [ y ] = CLO19_pnn( data_training, x_cari )
%By: Ida Bagus Dwi Satria Kusuma / 1301140297
% Fungsi ini hanya digunakan untuk kasus pnn dengan dataset pathbased dari
% nomor 19 CLO 3 Tugas 2 matakuliah machine learning.

% menghitung jumlah atribut
jumlahAtribut = size(data_training,2)-1;

% memasukkan semua keterangan kelas ke dalam matriks data_kelas
data_kelas = data_training(:,jumlahAtribut+1);

% memasukkan semua atribut data training ke dalam matriks X.
dt = data_training(:,1:jumlahAtribut);

% mencari data dengan kelas tertentu
dt_A = dt(find(data_kelas==1),:);
dt_B = dt(find(data_kelas==2),:);
dt_C = dt(find(data_kelas==3),:);

% size_A  = size(dt_A,1);
% size_B = size(dt_B,1);
% size_C = size(dt_C,1);

% pnn dengan sigma = 0.2
sigma = 1;

x1 = x_cari(1,1);
x2 = x_cari(1,2);

% hasil sum kelas A
a_Ay = -(((x1 - dt_A(:,1)).^2+(x2 - dt_A(:,2)).^2)/(2*sigma^2));
% b_A = 1/sqrt(2*pi);
y_Ay = sum(exp(a_Ay));

% hasil sum kelas B
a_By = -(((x1 - dt_B(:,1)).^2+(x2 - dt_B(:,2)).^2)/(2*sigma^2));
% b_B = 1/sqrt(2*pi);
y_By = sum( exp(a_By));

% hasil sum kelas C
a_Cy = -(((x1 - dt_C(:,1)).^2+(x2 - dt_C(:,2)).^2)/(2*sigma^2));
% b_C = 1/sqrt(2*pi);
y_Cy = sum(exp(a_Cy));

y_Sy = [y_Ay y_By y_Cy];

% mencari nilai maksimum dari hasil sum kelas A, B, dan C
yy = max(y_Sy);

% meng-assign kelas ke dalam variabel y
if yy == y_Ay
    y = 1;
elseif yy == y_By
    y = 2;
else  %if yy == y_Cy
    y = 3;
end

end

