% Name          :Ida Bagus Dwi Satria Kusuma
% Student's ID  : 1301140297

function [ output ] = jaccard_coeff_n( idMovie1 , n)
% fungsi jaccard_coeff_n digunakan untuk mencari film-film dengan Jaccard
% Coefficient terbesar sebanyak n.
% input : idMovie1 , n (jumlah ID yang ingin ditampilkan)
% output : - 

% untuk memastikan database sudah ke-load
[ratings items userids itemids] = loadmovielens();

% mengambil jumlah itemids
[y x] = size(itemids);
% menggunakan jumlah itemids untuk membuat matriks kosong 'mat_coeffn'
mat_coeffn = zeros([x 2]);

for i=1:x
%     jika iterasi menemukan idMovie sesuai input, maka iterasi akan
%     diskip, karena itu sama saja dengan membandingkan 'Jaccard
%     Coefficient' pada titik yang sama.
    if i == idMovie1
        continue;
    end
%     Menghitung 'Jaccard Coeffcient' film inputan dengan film id ke i,
%     lalu memasukkannya hasilnya ke dalam mat_coeffn(1).
    mat_coeffn(i,1) = jaccard_coeff(idMovie1,itemids(i));
    mat_coeffn(i,2) = i;
%     Menampilkan detail iterasi, idMovie, jumlah Jaccard Coefficientnya,
%     dan judul film.
    display_coeff = sprintf('iteration - %d \t| Movie ID %d \t |  %.3f \t | %s', i, mat_coeffn(i,2),mat_coeffn(i,1),items{1,i} );
    disp(display_coeff);
end

% Membuat matriks baru yang isinya adalah mat_coeffn yang telah disortir
% dari kecil ke besar.
X = sortrows(mat_coeffn,-1);

% Menampilkan film-film dengan Jaccard Coefficient terbesar sebanyak n
display_f = sprintf('Showing movies that related to %s', items{idMovie1});
disp(display_f);
for i=1:n
    display_final = sprintf('ID : %d \t | %s \t | Jaccard Coeff : %.3f', X(i,2), items{X(i,2)}, X(i,1));
    disp(display_final);
end

end

