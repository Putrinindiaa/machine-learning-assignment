% membaca data
data = csvread('pathbased.csv');

% scatter data
% scatter(data(:,1),data(:,2));

% mengambil ukuran data
% sizeData = size(data,1);

% membuat data untuk test secara acak
data_test = datasample(data,3);

% membuat data untuk training dan tidak memasukkan baris data dari data
% test ke dalam data training
data_training = data;
for i=1:size(data_test)
    x = find(data(:,1)==data_test(i,1) & data(:,2)==data_test(i,2));
    data_training(x , :) = [];
end

% menghitung jumlah data contoh atau data latih
jumlahContoh = size(data_training,1);

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


% Probabilistic Neural Network
% Terdapat 2 atribut dan 3 kelas.

x1 = [data_test(1,1) data_test(1,2)];
y1 = CLO19_pnn(data_training, x1);

x2 = [data_test(2,1) data_test(2,2)];
y2 = CLO19_pnn(data_training, x2);

x3 = [data_test(3,1) data_test(3,2)];
y3 = CLO19_pnn(data_training, x3);

% scatter data sesuai kelas
decbound2D(data_training(:,1),data_training(:,2),data_training(:,3)); 
title('Scatter Plot Data Set dan Prediksi Data Test');
hold on;
scatter(dt_A(:,1),dt_A(:,2),'o','red');
scatter(dt_B(:,1),dt_B(:,2),'^','blue');
scatter(dt_C(:,1),dt_C(:,2),'+','green');
scatter(x1(1,1),x1(1,2),'o','filled','y');
scatter(x2(1,1),x2(1,2),'o','filled','m');
scatter(x3(1,1),x3(1,2),'o','filled','c');
legend('Kelas A','Kelas B','Kelas C','data cari 1','data cari 2','data cari 3');



fprintf('Data 1: %.4f %.4f , y1 = %f\nData 2: %f %f , y2 = %f \nData 3: %f %f , y3 = %f \n',x1(1,1),x1(1,2),y1,x2(1,1),x2(1,2),y2,x3(1,1),x3(1,2),y3);

