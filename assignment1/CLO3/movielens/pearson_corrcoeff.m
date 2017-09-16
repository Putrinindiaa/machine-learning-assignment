function [ pearson ] = pearson_corrcoeff( idMovie1 , idMovie2 )
%Fungsi pearson_corrcoeff digunakan untuk menghitung 'Pearson Correlation Coefficient' dari
%dua film.
% Input : idMovie1 (double) , idMovie2(double)
% Output : Pearson Correlation Coefficient

[ratings items userids itemids] = loadmovielens();

% LANGKAH #1
% Mencari baris yang itemsid-nya (kolom ke-2) = idMovie1
rowMov1_logic = ratings(:,2) == idMovie1;

% Mencari baris yang itemsid-nya (kolom ke-2) = idMovie2
rowMov2_logic = ratings(:,2) == idMovie2;

% Hasil dari PROSES#1 akan menghasilkan matriks logical 0 & 1 yang
% akan digunakan untuk memfilter baris pada matriks 'ratings' yang memiliki
% idMovie.

% LANGKAH #2
% Memfilter matriks rating yang itemsid-nya = idMovie1
rowMov1 = ratings(rowMov1_logic,:);

% Memfilter matriks rating yang itemsid-nya = idMovie1
rowMov2 = ratings(rowMov2_logic,:);

% LANGKAH #3
% Mencari user yang merate kedua movie
f11 = 0;
mat_mov1 = [0 0];
mat_mov2 = [0 0];
for i=1:size(rowMov1)
    for j=1:size(rowMov2)
        if rowMov1(i,1) == rowMov2(j,1)
            f11 = f11 + 1;
%             assign id
            mat_mov1(f11,1) = rowMov1(i,1);
            mat_mov2(f11,1) = rowMov2(j,1);
            
%             assign rating by id
            mat_mov1(f11,2) = rowMov1(i,3);
            mat_mov2(f11,2) = rowMov2(j,3);
            
            
%             # Untuk melihat f11 secara detail, uncomment 2 baris di bawah
%             ini #
%             text = sprintf('%d \t|%d : %d \t | %d : %d \t', f11,mat_mov1(f11,1),mat_mov1(f11,2),mat_mov2(f11,1),mat_mov2(f11,2));
%             disp(text);
        end
    end
end

% # Untuk menampilkan jumlah user yang me-rate kedua film (f11), uncomment 2
% baris di bawah baris ini#
% print_f11 = sprintf('Jumlah user yang merate kedua film : \t %d',f11);
% disp(print_f11);

x=mat_mov1(:,2);
y=mat_mov2(:,2);

[n ~]= size(x);
% E(x)
Ex = sum(x);
% print value
% text = sprintf('E(x) \t: %.3f',Ex);
% disp(text);

% E(y)
Ey = sum(y);
% print value
% text = sprintf('E(y) \t: %.3f',Ey);
% disp(text);

% E(xy)
Exy = 0;
for i=1:size(x)
    Exy = Exy + (x(i) * y(i));
end
% print value
% text = sprintf('E(xy) \t: %.3f',Exy);
% disp(text);

% E(x^2)
Ex2 = sum(x.^2);
% print value
% text = sprintf('E(x^2) \t: %.3f',Ex2);
% disp(text);

% E(y^2)
Ey2 = sum(y.^2);
% print value
% text = sprintf('E(y^2) \t: %.3f',Ey2);
% disp(text);


% (E(x))^2
Ex_2 = (sum(x))^2;
% print value
% text = sprintf('(E(x))^2 \t: %.3f',Ex_2);
% disp(text);

% (E(y))^2
Ey_2 = (sum(y))^2;
% print value
% text = sprintf('(E(y))^2 \t: %.3f',Ey_2);
% disp(text);


% LANGKAH 4
% Menghitung Pearson Correlation Coefficient
r_up = (n*Exy)-(Ex*Ey);
r_down = sqrt((n * Ex2 - Ex_2) * (n * Ey2-Ey_2));
r = r_up / r_down;

% # Untuk menampilkan jumlah Pearson Correlation Coefficient dari kedua film, uncomment 2 baris di bawah ini#
% text = sprintf('Movie 1 : (%d) %s \nMovie 2 : (%d) %s \n Pearson Correlation Coefficient \t: %.4f',idMovie1, items{idMovie1}, idMovie2, items{idMovie2}, r);
% disp(text);

pearson = r;


end

