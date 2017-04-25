% II. Rozpoznawanie obiektow za pomocą wspolczynników ksztaltu
clear all; close all

% 1. Indeksacja wbudowana w IPT Matlab'a
obraz = imread('ksztalty.bmp');

figure(1)
subplot(1, 3, 1)
imshow(obraz, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(bwlabel(obraz, 4), [])
title('4 sasiadow')

subplot(1, 3, 3)
imshow(bwlabel(obraz, 8), [])
title('8 sasiadow')

% 2. Wspolczynniki ksztaltu
figure(2)
labeled = bwlabel(obraz, 8);
imshow(labeled, [])
% Ponumerowanie obiektow
r = regionprops(labeled,'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end
wsp = obliczWspolczynniki(labeled);

[XX, YY] = size(labeled);

for i = 1:XX
   for j = 1:YY
        piksel = labeled(i,j);
        if piksel ~= 0 && ~(wsp(piksel,1) > 0.73 && wsp(piksel,1) < 0.86)
            labeled(i,j) = 0;
        end
   end
end

figure(3)
imshow(labeled, [])


