data = csvread('linear_7.csv');

% menghitung jumlah data contoh atau data latih.
jumlahContoh = size(data,1);
% menghitung n atau jumlah data
jumlahAtribut = size(data,2) - 1;

% memasukkan semua atribut ke dalam matriks X.
X = data(:,1:jumlahAtribut);
% memasukkan semua keterangan kelas ke dalam matriks data_kelas
data_kelas = data(:,jumlahAtribut+1);

% Memisahkan data menjadi dua kelas, yaitu kelas 1 dengan nama X_A dan
% kelas -1 dengan nama X_B
X_A = X(find(data_kelas==1),:);
X_B = X(find(data_kelas==-1),:);

% membuat parameter masukan untuk fungsi quadratic programming
% H adalah matriks identitas dengan ukuran (n+1)*(n+1) di mana n adalah
% jumlah data
H = eye(jumlahAtribut+1);

% untuk memastikan kita meminimalkan hanya vektor berat w, bukan konstan b
H(jumlahAtribut+1, jumlahAtribut+1) = 0;

% MEMBUAT PARAMETER QUADPROG
f = zeros(jumlahAtribut+1,1);
Z = [X ones(jumlahContoh,1)];
A = -diag(data_kelas)*Z;
c = -1*ones(jumlahContoh,1);

% mencari vektor w dengan menggunakan fungsi quadprog
w = quadprog(H,f,A,c);

% meng-assign masing-masing nilai vektor w ke w1, w2, dan b
w1 = w(1,1);
w2 = w(2,1);
b = w(3,1);

% membuat persamaan hyperplane untuk kasus ini menggunakan w1, w2, dan b
% yang telah dicari menggunakan fungsi quadratic programming
syms x;
hyper = symfun(-(w1*x+b)/w2, x);

% memvisualkan penyebaran data dan garis hyperplanenya.
figure;
hold on;
scatter(X_A(:,1), X_A(:,2),'^','red');
scatter(X_B(:,1), X_B(:,2),'o','blue');
fplot(hyper);