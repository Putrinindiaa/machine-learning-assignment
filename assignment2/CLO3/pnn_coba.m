%By: Ida Bagus Dwi Satria Kusuma / 1301140297
% Fungsi ini hanya digunakan untuk kasus pnn dengan dataset pathbased dari
% nomor 19 CLO 3 Tugas 2 matakuliah machine learning.

x_cari = x1;
% menghitung jumlah data contoh atau data latih
jumlahContoh = size(data_training,1);

% menghitung jumlah atribut
jumlahAtribut = size(data_training,2)-1;

% memasukkan semua keterangan kelas ke dalam matriks data_kelas
data_kelas = data_training(:,jumlahAtribut+1);

% memasukkan semua atribut data training ke dalam matriks X.
dt = data_training(:,1:jumlahAtribut);

% mencari data dengan kelas tertentu
dt_At = dt(find(data_kelas==1),:);
dt_Bt = dt(find(data_kelas==2),:);
dt_Ct = dt(find(data_kelas==3),:);

size_At  = size(dt_At,1);
size_Bt = size(dt_Bt,1);
size_Ct = size(dt_Ct,1);

% scatter data sesuai kelas
% figure; hold on;
% scatter(dt_At(:,1),dt_At(:,2),'o','red');
% scatter(dt_Bt(:,1),dt_Bt(:,2),'^','blue');
% scatter(dt_Ct(:,1),dt_Ct(:,2),'+','green');
% legend('Kelas A','Kelas B','Kelas C');
% hold off;

% pnn dengan sigma = 1
sigma = 1;

% hasil sum kelas A
a_Ay = -(((dt_At(:,1) - x_cari(:,1))+(dt_At(:,2)-x_cari(:,2))).^2./(2*sigma));
b_A = 1/sqrt(2*pi);
y_Ay = 1/size_At * sum(b_A * exp(a_Ay));

% hasil sum kelas B
a_By = -(((dt_Bt(:,1) - x_cari(:,1))+(dt_Bt(:,2)-x_cari(:,2))).^2./(2*sigma));
b_B = 1/sqrt(2*pi);
y_By = 1/size_Bt * sum(b_B * exp(a_By));

% hasil sum kelas C
a_Cy = -(((dt_Ct(:,1) - x_cari(:,1))+(dt_Ct(:,2)-x_cari(:,2))).^2./(2*sigma));
b_C = 1/sqrt(2*pi);
y_Cy = 1/size_Ct * sum(b_C * exp(a_Cy));

y_Sy = [y_Ay y_By y_Cy];
yy = max(y_Sy);

if yy == y_Ay
    yt = 1;
elseif yy == y_By
    yt = 2;
else  %if yy == y_Cy
    yt = 3;
end


