% Binaryzacja lokalna
close all; clear all;

rice = imread('rice.png');
[X Y] = size(rice);
riceBW = rice;
W2 = 50; % wielkosc okna
for i = 1:X
   for j = 1:Y
      mean = meanLT(i, j, floor(W2/2), riceBW, X, Y); 
      if riceBW(i, j) >= mean
          rice(i, j) = 255;
      else
          rice(i, j) = 0;
      end
   end
end

figure(1)
subplot(1, 2, 1)
imshow(riceBW)
title('Oryginal')

subplot(1, 2, 2)
imshow(rice)
title('Binaryzacja')


rice = imread('rice.png');
[X Y] = size(rice);
riceBW = rice;
W2 = 50; % wielkosc okna
k = 0.15;
R = 128;
% Algorytm Sauvoli
for i = 1:X
   for j = 1:Y
      mean = meanLT(i, j, floor(W2/2), riceBW, X, Y);
      std = stddevLT(i, j, floor(W2/2), riceBW, mean, X, Y);
      threshold = mean*(1-k*(std/R-1));
      if riceBW(i, j) >= threshold
          rice(i, j) = 255;
      else
          rice(i, j) = 0;
      end
   end
end

figure(2)
subplot(1, 2, 1)
imshow(riceBW)
title('Oryginal')

subplot(1, 2, 2)
imshow(rice)
title('Binaryzacja - Sauvoli')

% katalog
rice = imread('katalog.bmp');
[X Y] = size(rice);
riceBW = rice;
W2 = 50; % wielkosc okna
k = 0.15;
R = 128;
% Algorytm Sauvoli
for i = 1:X
   for j = 1:Y
      mean = meanLT(i, j, floor(W2/2), riceBW, X, Y);
      std = stddevLT(i, j, floor(W2/2), riceBW, mean, X, Y);
      threshold = mean*(1+k*(std/R-1));
      if riceBW(i, j) >= threshold
          rice(i, j) = 255;
      else
          rice(i, j) = 0;
      end
   end
end

figure(3)
subplot(1, 2, 1)
imshow(riceBW)
title('Oryginal')

subplot(1, 2, 2)
imshow(rice)
title('Binaryzacja - Sauvoli')
