clear all, close all;

% Wczytanie pliku
plansza = imread('plansza.tif');

% Filtr usredniajacy
filtr_usr = fspecial('average');

% Konwolucja
result = uint8(conv2(double(plansza), double(filtr_usr), 'same'));

% Wyswietlenie wynikow
figure(1)
subplot(1, 3, 1)
imshow(plansza, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(result, [])
title('Po filtracji')

subplot(1, 3, 3)
imshow(imabsdiff(plansza, result), [])
title('Roznica')

% Roznej wielkosci maski
figure(2)
subplot(1, 5, 1)
filtr_usr = fspecial('average', 5);
result = uint8(conv2(double(plansza), double(filtr_usr), 'same'));
imshow(result, [])
title('3x3')

subplot(1, 5, 2)
filtr_usr = fspecial('average', 5);
result = uint8(conv2(double(plansza), double(filtr_usr), 'same'));
imshow(result, [])
title('5x5')

subplot(1, 5, 3)
filtr_usr = fspecial('average', 9);
result = uint8(conv2(double(plansza), double(filtr_usr), 'same'));
imshow(result, [])
title('9x9')

subplot(1, 5, 4)
filtr_usr = fspecial('average', 15);
result = uint8(conv2(double(plansza), double(filtr_usr), 'same'));
imshow(result, [])
title('15x15')

subplot(1, 5, 5)
filtr_usr = fspecial('average', 35);
result = uint8(conv2(double(plansza), double(filtr_usr), 'same'));
imshow(result, [])
title('35x35')

% Wczytanie lena.bmp
lena = imread('lena.bmp');
figure(3)
subplot(1, 5, 1)
filtr_usr = fspecial('average', 5);
result = uint8(conv2(double(lena), double(filtr_usr), 'same'));
imshow(result, [])
title('3x3')

subplot(1, 5, 2)
filtr_usr = fspecial('average', 5);
result = uint8(conv2(double(lena), double(filtr_usr), 'same'));
imshow(result, [])
title('5x5')

subplot(1, 5, 3)
filtr_usr = fspecial('average', 9);
result = uint8(conv2(double(lena), double(filtr_usr), 'same'));
imshow(result, [])
title('9x9')

subplot(1, 5, 4)
filtr_usr = fspecial('average', 15);
result = uint8(conv2(double(lena), double(filtr_usr), 'same'));
imshow(result, [])
title('15x15')

subplot(1, 5, 5)
filtr_usr = fspecial('average', 35);
result = uint8(conv2(double(lena), double(filtr_usr), 'same'));
imshow(result, [])
title('35x35')

% Inna maska
M = [1 2 1; 2 4 2; 1 2 1];
M = M / sum(sum(M)); % normalizacja
result = uint8(conv2(double(lena), double(M), 'same'));
figure(4)
subplot(1, 2, 1)
imshow(lena, [])
title('Oryginal')

subplot(1, 2, 2)
imshow(result, [])
title('Filtracja')

% Filtracja z wykorzystanie rozkladu Gaussa
filtr_gauss = fspecial('gaussian', 5, 0.5);
figure(5)
mesh(filtr_gauss)

% Rozne wartosci odchylenia standardowego 
figure(6)
subplot(1, 3, 1)
filtr_gauss = fspecial('gaussian', 5, 0.5);
result = uint8(conv2(double(lena), double(filtr_gauss), 'same'));
imshow(result, [])
title('Std: 0.5')

subplot(1, 3, 2)
filtr_gauss = fspecial('gaussian', 5, 5);
result = uint8(conv2(double(lena), double(filtr_gauss), 'same'));
imshow(result, [])
title('Std: 5')

subplot(1, 3, 3)
filtr_gauss = fspecial('gaussian', 5, 10);
result = uint8(conv2(double(lena), double(filtr_gauss), 'same'));
imshow(result, [])
title('Std: 10')
