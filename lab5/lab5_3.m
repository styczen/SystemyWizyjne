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
filtr_lapl = fspecial('laplacian', 0.5);
result = uint8(conv2(double(moon), double(filtr_lapl), 'same'));

figure(2)
subplot(1, 4, 1)
imshow(moon, [])
title('Oryginal')

subplot(1, 4, 2)
imshow(result, [])
title('Filtracja')

subplot(1, 4, 3)
imshow(imabsdiff(result, moon), [])
title('Wyostrzenie')

subplot(1, 4, 4)
imshow(imabsdiff(moon, imabsdiff(result, moon) ), [])
title('Roznica')

% Unsharp masking
dipxe = imread('dipxe.jpg');
filtr_rozmycie = fspecial('gaussian', 5);

figure(3)
subplot(1, 5, 1)
imshow(dipxe, [])
title('Oryginal')

rozmycie = uint8(conv2(double(dipxe), filtr_rozmycie, 'same'));
subplot(1, 5, 2)
imshow(rozmycie, [])
title('Rozmycie')

subplot(1, 5, 3)
imshow(dipxe-rozmycie, [])
title('Maska')

subplot(1, 5, 4)
k=1; % unsharp masking
imshow(dipxe*(k+1)-k*rozmycie, [])
title('Unsharp masking')

subplot(1, 5, 5)
k=4.5;
imshow(dipxe*(k+1)-k*rozmycie, [])
title('Highboost filtring')
