% Name          :Ida Bagus Dwi Satria Kusuma
% Student's ID  : 1301140297

function [ ] = searchMovie( moviename )
% Input : judul
% Fungsi ini digunakan untuk mencari id sebuah film dengan menginputkan
% judul filmnya

[ratings items userids itemids] = loadmovielens();

k = strfind(items, moviename);
[x z] = size(k);

indeks = 0;
for i=1:z
    if isempty(k{i}) == 0
        indeks = i;
        break;
    end
end

show_indeks = sprintf('Indeks of %s is : %d', moviename,indeks);
disp(show_indeks);

end

