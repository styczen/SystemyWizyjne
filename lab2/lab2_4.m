close all;clear all;

lena = imread('lena.bmp');

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

% Transformacja
figure(3)
theta = -45;
matrix = [cosd(theta) -sind(theta) 0; sind(theta) cosd(theta) 0; 0 0 1];
tform = affine2d(matrix);
imshow(imwarp(lena, tform), [])

% tform = maketform('affine',matrix);
% temp_img = imtransform(lena, tform);
imshow(temp_img, [])