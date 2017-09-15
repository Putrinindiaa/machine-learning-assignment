function [ ] = searchMovie( moviename )
%SEARCHMOVIE Summary of this function goes here
%   Detailed explanation goes here

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

disp(indeks);

end

