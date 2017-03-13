close all; clear all; 
% Wczytanie obrazu
lena = imread('lena100.bmp');

% Przeskalowanie do rozmiaru 200x200
% najblizszy sasiad
lena200_1 = imresize(lena, 2, 'nearest');
figure(1)
imshow(lena200_1)

% dwuliniowa
lena200_2 = imresize(lena, 2, 'bilinear');
figure(2)
imshow(lena200_2)

% dwukubiczna
lena200_3 = imresize(lena, 2, 'bilinear');
figure(3)
imshow(lena200_3)

% Wczytanie obrazu szachownica
szach = imread('szachownica.bmp');
%i = imfinfo('szachownica.bmp');

% Przeskalowanie do rozmiaru 160x160
% najblizszy sasiad
szach160_1 = imresize(szach, 10, 'nearest');
figure(4)
imshow(szach160_1)

% dwuliniowa
szach160_2 = imresize(szach, 10, 'bilinear');
figure(5)
imshow(szach160_2)

% dwukubiczna
szach160_3 = imresize(szach, 10, 'bilinear');
figure(6)
imshow(szach160_3)

% Przeskalowanie do rozmiaru 100x100
% najblizszy sasiad
szach100_1 = imresize(szach, 6.25, 'nearest');
figure(7)
imshow(szach100_1)

% dwuliniowa
szach100_2 = imresize(szach, 6.25, 'bilinear');
figure(8)
imshow(szach100_2)

% dwukubiczna
szach100_3 = imresize(szach, 6.25, 'bilinear');
figure(9)
imshow(szach100_3)

% ODPOWIEDZ:
% Najlepszy rezultat dla przeskalowania sztucznych obrazów dala metoda
% najblizszego sasiada


