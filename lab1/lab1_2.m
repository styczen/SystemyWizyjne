clear all, close all

% 1. Wczytanie obrazka lena_gray.bmp
lena_g = imread('lena_gray.bmp');

% 2. Konwersja do obrazka indeksowanego
[X_lena, map_lena] = gray2ind(lena_g, 256);

% 3. Wyswietlenie obrazka indeksowanego
figure(1);
imshow(X_lena, map_lena);

% 4. Zmiana mapy kolorow
figure(2);
new_map = colormap('summer');
imshow(X_lena, new_map);