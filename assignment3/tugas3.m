% Karena digit terakhir dari NIM 1301140297 adalah 7, maka data yang
% digunakan adalah pathbased.
% Membaca data
data = csvread('pathbased.csv');

% menghitung jumlah atribut
jumlahAtribut = size(data,2)-1;
data_kelas = data(:,jumlahAtribut+1);

%  mencari data dengan kelas tertentu
dt = data(:,1:jumlahAtribut);

% dengan menggunakan size(unique(data_kelas)), kita mendapatkan jenis kelas
% adalah 3 untuk dataset pathbased.csv. Sehingga K = 3.

dt_A = dt(find(data_kelas==1),:);
dt_B = dt(find(data_kelas==2),:);
dt_C = dt(find(data_kelas==3),:);

% 1.a tanpa kelas
figure;
scatter(dt(:,1),dt(:,2));

% 1.b dengan label kelas
figure;
hold on;
scatter(dt_A(:,1),dt_A(:,2),'r+');
scatter(dt_B(:,1),dt_B(:,2),'bo');
scatter(dt_C(:,1),dt_C(:,2),'gd');
legend('kelas1','kelas2','kelas3');
hold off;
% Membuat matriks tanpa label kelas
data_matrix = dt;

% Basic K-means Algorithm *Introduction to Data Mining - Tan, Steinbach
% Select K points as initial centroid
K = size(unique(data_kelas),1);

% inisialisasi random centroid
% centroid = datasample(data,3);

% inisialisasi centroid tiap kelas
fc_A = datasample(dt_A,1);
fc_B = datasample(dt_B,1);
fc_C = datasample(dt_B,1);

% centroid = [fc_A; fc_B; fc_C];
sse_current = [0 0 0];
sse_out = [1 1 1];
i = 0;
while(~isequal(sse_current,sse_out))
% Form K clusters by assigning each point to its closes centroid
% ai = arg min_j || x_i - c_j ||2
% Recompute the centroid of each cluster
sse_out = sse_current;
[update_centroid, cluster_tebak] = k_means(data_matrix, centroid);
x = centroid(:,1:2) == update_centroid(:,1:2);
centroid = update_centroid;
data_matrix = cluster_tebak;
i = i+1;
sse_current = sse(cluster_tebak, update_centroid);
disp(i);
disp(sse_current);
disp(sse_out);
end

figure
hold on;
data_kelas_cluster = cluster_tebak(:,jumlahAtribut+1);
cls_A = cluster_tebak(find(data_kelas_cluster==1),:);
cls_B = cluster_tebak(find(data_kelas_cluster==2),:);
cls_C = cluster_tebak(find(data_kelas_cluster==3),:);
scatter(cls_A(:,1),cls_A(:,2));
scatter(cls_B(:,1),cls_B(:,2));
scatter(cls_C(:,1),cls_C(:,2));
scatter(update_centroid(1,1),update_centroid(1,2),'ro','filled');
scatter(update_centroid(2,1),update_centroid(2,2),'bo','filled');
scatter(update_centroid(3,1),update_centroid(3,2),'go','filled');
hold off;
figure;
hold on;
scatter(cls_A(:,1),cls_A(:,2));
scatter(cls_B(:,1),cls_B(:,2));
scatter(cls_C(:,1),cls_C(:,2));
scatter(update_centroid(1,1),update_centroid(1,2),'ro','filled');
scatter(update_centroid(2,1),update_centroid(2,2),'bo','filled');
scatter(update_centroid(3,1),update_centroid(3,2),'go','filled');
scatter(dt_A(:,1),dt_A(:,2),'r+');
scatter(dt_B(:,1),dt_B(:,2),'bo');
scatter(dt_C(:,1),dt_C(:,2),'gd');
legend('kelas1-new','kelas2-new','kelas3-new','centroid-1','centroid-2','centroid-3','kelas1','kelas2','kelas3');

hold off;