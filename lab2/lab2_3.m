close all;clear all;

lena = imread('lena.bmp');

% Przeskalowanie do 128x128
lena128 = imresize(lena, 0.25);

% Zmiana szarosci
% na 0 -31
lena31 = imadjust(lena128, [0; 1], [0; 31/255]);
% 0 - 15
lena15 = imadjust(lena128, [0; 1], [0; 15/255]);
% 0 - 7
lena7 = imadjust(lena128, [0; 1], [0; 7/255]);
% 0 - 3
lena3 = imadjust(lena128, [0; 1], [0; 3/255]);
% 0 - 1
lena1 = imadjust(lena128, [0; 1], [0; 1/255]);

% Wyswietlenie
figure(1)

subplot(3, 2, 1)
imshow(lena128, [])
title('0 - 255')

subplot(3, 2, 2)
imshow(lena31, [])
title('0 - 31')

subplot(3, 2, 3)
imshow(lena15, [])
title('0 - 15')

subplot(3, 2, 4)
imshow(lena7, [])
title('0 - 7')

subplot(3, 2, 5)
imshow(lena3, [])
title('0 - 3')

subplot(3, 2, 6)
imshow(lena1, [])
title('0 - 1')