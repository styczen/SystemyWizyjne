clear all; close all;

% Wczytanie obrazu moon.bmp
moon = imread('moon.bmp');

M = [0 1 0; 1 -4 1; 0 1 0]; % maska
M = M / 9; % normalizacja

% Konwolucja
moon_result = conv2(double(moon), double(M), 'same');

% Normalizacja
moon_result_scale = 128 + moon_result; % skalowanie
moon_result_abs = abs(moon_result); % wartosc bezwgledna

figure(1)
subplot(1, 3, 1)
imshow(moon, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(moon_result_scale, [])
title('Skalowanie')

subplot(1, 3, 3)
imshow(moon_result_abs, [])
title('Wartosc bezwzgledna')

% Maska laplasjanu
filtr_lapl = fspecial(



