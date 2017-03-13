close all;clear all;

% Wczytanie obrazku lena.bmp
lena = imread('lena.bmp');

% Przeskalowanie
lena256 = imresize(lena, 0.5);
figure(1)
imshow(lena256, 'InitialMagnification', 200)

lena128 = imresize(lena, 0.25);
figure(2)
imshow(lena128, 'InitialMagnification', 400)

lena64 = imresize(lena, 0.125);
figure(3)
imshow(lena64, 'InitialMagnification', 800)
