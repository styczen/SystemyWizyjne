% Binaryzacja lokalna
close all; clear all;

obraz = imread('rice.png');
[X Y] = size(obraz);
obrazBW = obraz;
W2 = 20; % wielkosc okna
for i = 1:X
   for j = 1:Y
      mean = meanLT(i, j, floor(W2/2), obraz, X, Y); 
      if obraz(i, j) >= mean
          obrazBW(i, j) = 255;
      else
          obrazBW(i, j) = 0;
      end
   end
end

figure(1)
subplot(1, 2, 1)
imshow(obraz)
title('Oryginal')

subplot(1, 2, 2)
imshow(obrazBW)
title('Binaryzacja')


obraz = imread('rice.png');
[X Y] = size(obraz);
obrazBW = obraz;
W2 = 20; % wielkosc okna
k = 0.15;
R = 128;
% Algorytm Sauvoli dla rice.png
for i = 1:X
   for j = 1:Y
      mean = meanLT(i, j, floor(W2/2), obraz, X, Y);
      std = stddevLT(i, j, floor(W2/2), obraz, mean, X, Y);
      threshold = mean*(1-k*(std/R-1));
      if obraz(i, j) >= threshold
          obrazBW(i, j) = 255;
      else
          obrazBW(i, j) = 0;
      end
   end
end

figure(2)
subplot(1, 2, 1)
imshow(obraz)
title('Oryginal')

subplot(1, 2, 2)
imshow(obrazBW)
title('Binaryzacja - Sauvoli')

% katalog
obraz = imread('katalog.bmp');
[X Y] = size(obraz);
obrazBW = obraz;
W2 = 20; % wielkosc okna
k = 0.15;
R = 128;
% Algorytm Sauvoli dla katalog.png
for i = 1:X
   for j = 1:Y
      mean = meanLT(i, j, floor(W2/2), obraz, X, Y);
      std = stddevLT(i, j, floor(W2/2), obraz, mean, X, Y);
      threshold = mean*(1+k*(std/R-1));
      if obraz(i, j) >= threshold
          obrazBW(i, j) = 255;
      else
          obrazBW(i, j) = 0;
      end
   end
end

figure(3)
subplot(1, 2, 1)
imshow(obraz)
title('Oryginal')

subplot(1, 2, 2)
imshow(obrazBW)
title('Binaryzacja - Sauvoli')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

