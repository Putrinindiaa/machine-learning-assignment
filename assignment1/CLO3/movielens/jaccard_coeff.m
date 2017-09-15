% Name          :Ida Bagus Dwi Satria Kusuma
% Student's ID  : 1301140297

function [ output ] = jaccard_coeff(idMovie1, idMovie2)
%Fungsi jaccard_coeff digunakan untuk menghitung 'Jaccard Coefficient' dari
%dua film.
% Input : idMovie1 (double) , idMovie2(double)
% Output : Jaccard Coefficient

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

for i=1:size(rowMov1)
    for j=1:size(rowMov2)
        if rowMov1(i,1) == rowMov2 (j,1)
            f11 = f11 + 1;
%             # Untuk melihat f11 secara detail, uncomment 2 baris di bawah
%             ini #
%             text = sprintf('%d \t|%d \t| %d \t | %d \t | %d \t', f11,i,j,rowMov1(i,1),rowMov2 (j,1));
%             disp(text);
        end
    end
end

% # Untuk menampilkan jumlah user yang me-rate kedua film (f11), uncomment 2
% baris di bawah baris ini#
% print_f11 = sprintf('Jumlah user yang merate kedua film : \t %d',f11);
% disp(print_f11);

% Menghitung user yang merate Movie 1
[f10 ~] = size(rowMov1);
f10 = f10 - f11;
% # Untuk menampilkan jumlah user yang me-rate film 1 (f10), uncomment 2
% baris di bawah baris ini#
% print_f10 = sprintf('Jumlah user yang merate film (%d) %s : \t %d',idMovie1,items{1,idMovie1},f10);
% disp(print_f10);

% Menghitung user yang merate Movie 2
[f01 ~] = size(rowMov2);
f01 = f01 - f11;
% # Untuk menampilkan jumlah user yang me-rate film 2 (f01), uncomment 2
% baris di bawah baris ini#
% print_f01 = sprintf('Jumlah user yang merate film (%d) %s : \t %d',idMovie2,items{1,idMovie2},f01);
% disp(print_f01);

% LANGKAH 4
% Menghitung jaccard
jaccard = f11 / (f01 + f10 + f11);
% # Untuk menampilkan jumlah Jaccard coefficient dari kedua film, uncomment 2 baris di bawah ini#
% print_jaccard = sprintf('Jaccard coefficient : %.3f',jaccard);
% disp(print_jaccard);

output = jaccard;
end

