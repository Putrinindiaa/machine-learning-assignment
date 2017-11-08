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

size_A  = size(dt_A,1);
size_B = size(dt_B,1);
size_C = size(dt_C,1);
% pnn dengan sigma = 0.2
sigma = 6;

% hasil sum kelas A
a_Ay = -(((dt_A(:,1) - x_cari(1,1))+( dt_A(:,2) - x_cari(1,2) )).^2./(2*sigma^2));
b_A = 1/sqrt(2*pi);
y_Ay = 1/size_A * sum(b_A * exp(a_Ay));

% hasil sum kelas B
a_By = -(((dt_B(:,1) - x_cari(1,1))+(dt_B(:,2)-x_cari(1,2))).^2./(2*sigma^2));
b_B = 1/sqrt(2*pi);
y_By = 1/size_B * sum(b_B * exp(a_By));

% hasil sum kelas C
a_Cy = -(((dt_C(:,1) - x_cari(1,1))+(dt_C(:,2)-x_cari(1,2))).^2./(2*sigma^2));
b_C = 1/sqrt(2*pi);
y_Cy = 1/size_C * sum(b_C * exp(a_Cy));

y_Sy = [y_Ay y_By y_Cy];
yy = max(y_Sy);

if yy == y_Ay
    y = 1;
elseif yy == y_By
    y = 2;
else  %if yy == y_Cy
    y = 3;
end

end

