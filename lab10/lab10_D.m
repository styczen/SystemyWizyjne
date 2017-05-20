% D. Filtracja obrazu w dziedzinie czestotliwosci
clear all; close all;

image = imread('lena.bmp');
Y = fftshift(fft2(image)); % FT i przesuniecie

figure
subplot(1, 3, 1)
imshow(image, [])
title('Oryginal - Lena')

subplot(1, 3, 2)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda - Lena')

subplot(1, 3, 3)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza - Lena')

[f1,f2] = freqspace(512,'meshgrid'); % wygenerowanie wektora
Hd = ones(512); % inicjalizacja filtra
r = sqrt(f1.^2 + f2.^2); % r - promien kola w dziedzinie czestotliwosci
Hd((r>0.1)) = 0; % filtr dolprzepustowy

figure
colormap(jet(64)); 
mesh(f1, f2, Hd);
title('Wizualizacja odpowiedzi filtra')

Y = Y .* Hd; % filtracja, w dziedzinie czestotliwosci konwolucja sprowadza sie do mnozenia
Y = ifftshift(Y);
image = ifft2(Y); % odwrotna tranformata
figure
imshow(image, []);
title('Filtracja dolnoprzepustowa')
%%%
image = imread('lena.bmp');
Y = fftshift(fft2(image)); % FT i przesuniecie
Hd = ones(512); % inicjalizacja filtra
Hd((r<0.1)) = 0; % filtr gornoprzepustowy
Y = Y .* Hd; % filtracja, w dziedzinie czestotliwosci konwolucja sprowadza sie do mnozenia
Y = ifftshift(Y);
image = ifft2(Y); % odwrotna tranformata
figure
imshow(image, []);
title('Filtracja gornoprzepustowa')
%%%
image = imread('lena.bmp');
Y = fftshift(fft2(image)); % FT i przesuniecie
Hd = ones(512); % inicjalizacja filtra
Hd((r<0.1) & (r>0.5)) = 0; % filtr pasmowoprzepustowy
Y = Y .* Hd; % filtracja, w dziedzinie czestotliwosci konwolucja sprowadza sie do mnozenia
Y = ifftshift(Y);
image = ifft2(Y); % odwrotna tranformata
figure
imshow(image, []);
title('Filtracja pasmowoprzepustowa')
%%%
[f1,f2] = freqspace(512,'meshgrid'); % wygenerowanie wektora
Hd = ones(512); % inicjalizacja filtra
r = sqrt(f1.^2 + f2.^2); % r - promien kola w dziedzinie czestotliwosci
Hd((r<0.1)) = 0; % filtr gornoprzepustowy
h = fwind1(Hd,hanning(21)); % tworzenie filtra 2D
[H, f1, f2] = freqz2(h,512,512); % wyznaczanie odpowiedzi filtra
figure
colormap(jet(64))
mesh(f1, f1, H)
title('Wizualizacja odpowiedzi filtra z oknem Hanning')
%%%
image = imread('lena.bmp');
Y = fftshift(fft2(image)); % FT i przesuniecie
Y = Y .* H; % filtracja, w dziedzinie czestotliwosci konwolucja sprowadza sie do mnozenia
Y = ifftshift(Y);
image = ifft2(Y); % odwrotna tranformata
figure
imshow(image, []);
title('Filtracja gornoprzepustowa z Hanning')
%%%
[f1,f2] = freqspace(512,'meshgrid'); % wygenerowanie wektora
Hd = ones(512); % inicjalizacja filtra
r = sqrt(f1.^2 + f2.^2); % r - promien kola w dziedzinie czestotliwosci
Hd((r>0.1)) = 0; % filtr dolnoprzepustowy
h = fwind1(Hd,chebwin(21)); % tworzenie filtra 2D
[H, f1, f2] = freqz2(h,512,512); % wyznaczanie odpowiedzi filtra
figure
colormap(jet(64))
mesh(f1, f1, H)
title('Wizualizacja odpowiedzi filtra z oknem Chebysheva')
image = imread('lena.bmp');
Y = fftshift(fft2(image)); % FT i przesuniecie
Y = Y .* H; % filtracja, w dziedzinie czestotliwosci konwolucja sprowadza sie do mnozenia
Y = ifftshift(Y);
image = ifft2(Y); % odwrotna tranformata
figure
imshow(image, []);
title('Filtracja dolnoprzepustowa z Chebyshevem')


