close all;clear all;

lena = imread('lena.bmp');
% 1.
% Obrot 
lena90 = imrotate(lena, 90);
lena45 = imrotate(lena, 45);
lena_90 = imrotate(lena, -90);
lena_45 = imrotate(lena, -45);

figure(1)
subplot(2, 2, 1)
imshow(lena90, [])

subplot(2, 2, 2)
imshow(lena45, [])

subplot(2, 2, 3)
imshow(lena_90, [])

subplot(2, 2, 4)
imshow(lena_45, [])

% 2.
% Wczytanie szachownica
szach = imread('szachownica.bmp');

% Obrot
% najblizszy sasiad
szachs = imrotate(szach, -45, 'nearest');
% dwuliniowa
szachd = imrotate(szach, -45, 'bilinear');
% dwukubiczna
szachk = imrotate(szach, -45, 'bicubic');

figure(2)
subplot(1, 3, 1)
imshow(szachs, [])

subplot(1, 3, 2)
imshow(szachd, [])

subplot(1, 3, 3)
imshow(szachk, [])

% 3.
% Transformacja
figure(3)
theta = -45;
scale = 0.5;
pom = [scale 0 0; 0 scale 0; 0 0 1]; % macierz do pomniejszenia
matrix = [cosd(theta) -sind(theta) 0; sind(theta) cosd(theta) 0; 0 0 1] * pom;
tform = affine2d(matrix);
img = imwarp(lena, tform);

imshow(img, [])

% 4.
lena = imread('lena.bmp');
lena_translate = imtranslate(lena, [50 50]);
figure(4)
imshow(lena_translate, [])

translate_matrix = affine2d([1 0 0; 0 1 0; 50 50 1]);
             
lena_translate_imwarp = imwarp(lena, translate_matrix, 'OutputView', imref2d(size(lena)));
figure(5)
imshow(lena_translate_imwarp, [])

