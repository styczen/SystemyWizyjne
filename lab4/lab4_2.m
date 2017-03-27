clear all, close all;

% Wczytanie zdjecia phobos.bmp
phobos = imread('phobos.bmp');

figure(1)
subplot(1, 3, 1)
imshow(phobos)
title('Obraz oryginalny')

% Klasyczne wyrownywanie histogramu (HE)
subplot(1, 3, 2)
imshow(histeq(phobos))
title('Klasyczne wyrownanie histogramu')

% Wczytanie zadanego histogramu
load histogramZadany;

% Wyrowanie histogramu korzystajac z zadanego histogramu
subplot(1, 3, 3)
imshow(histeq(phobos, histogramZadany))
title('Zadany histogram')

% Rozciaganie oraz adaptacyjne wyrownywanie histogramu
figure(2)
subplot(1, 3, 1)
imshow(phobos)
title('Obraz oryginalny')

subplot(1, 3, 2)
imshow(imadjust(phobos))
title('Rozciaganie histogramu')

subplot(1, 3, 3)
imshow(adapthisteq(phobos))
title('Adaptacyjne wyrownywanie CLAHE')
