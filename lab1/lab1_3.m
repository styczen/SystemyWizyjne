clear all, close all

% 1. Wczytanie obrazka 'lena.bmp'
lena = imread('lena.bmp');

% 2. Wyswietlenie skladowych R, G, B na osobnych wykresach
R = lena(:,:,1); G = lena(:,:,2); B = lena(:,:,3);
figure(1);
subplot(2,2,1);
imshow(lena);
title('Oryginal');

subplot(2,2,2);
imshow(R);
title('R');

subplot(2,2,3);
imshow(G);
title('G');

subplot(2,2,4);
imshow(B);
title('B');

% 3. Konwersja do modelu barw HSV
hsv_lena = rgb2hsv(lena);
H = hsv_lena(:,:,1); S = hsv_lena(:,:,2); V = hsv_lena(:,:,3);
figure(2);
subplot(2,2,1);
imshow(hsv_lena);
title('Oryginal');

subplot(2,2,2);
imshow(H);
title('H');

subplot(2,2,3);
imshow(S);
title('S');

subplot(2,2,4);
imshow(V);
title('V');

% Konwersja do modelu barw YCbCr
ycrcr_lena = rgb2ycbcr(lena);
Y = ycrcr_lena(:,:,1); Cb = ycrcr_lena(:,:,2); Cr = ycrcr_lena(:,:,3);
figure(3);
subplot(2,2,1);
imshow(ycrcr_lena);
title('Oryginal');

subplot(2,2,2);
imshow(Y);
title('Y');

subplot(2,2,3);
imshow(Cb);
title('Cb');

subplot(2,2,4);
imshow(Cr);
title('Cr');