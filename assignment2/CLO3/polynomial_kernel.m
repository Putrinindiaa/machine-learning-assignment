function [ X3 ] = polynomial_kernel( X1 , X2 )
% CREATED BY : I.B. Dwi S. K. / 1301140297
% Fungsi : POLYNOMIAL-KERNEL
% Fungsi ini merubah bidang 2 dimensi menjadi bidang 3 dimensi.
% Misal matriks dua dimensi X mempunyai dua atribut yaitu X1 dan X2,
% maka untuk merubah matriks X menjadi 3 dimensi dapat menggunakan rumus
% atribut 1 = x1 , atribut 2 = x2, dan atribut 3 = x1^2 + x2^2
% INPUT : Atribut 1 (X1) dan atribut 2 (X2) dari matriks X.
% OUTPUT : Matriks 3 dimensi X3.

X3 = [X1(:,1) X2(:,1) (X1(:,1).^2 + X2(:,1).^2)];

end

