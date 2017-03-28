clear all, close all;

% Wczytanie pliku lenaSzum.bmp
lenaSzum = imread('lenaSzum.bmp');

% Filtracja medianowa
figure(1)
result = medfilt2(lenaSzum);
subplot(1, 3, 1)
imshow(lenaSzum, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(result, [])
title('Filtracja')

subplot(1, 3, 3)
imshow(imabsdiff(lenaSzum, result), [])
title('Roznica')

% Filtracja usredniajaca  i medianowa - porownanie
lena = imread('lena.bmp');
figure(2)
subplot(2, 3, 1)
imshow(lena)
title('Oryginal')

subplot(2, 3, 2)
filtr_usr = fspecial('average');
result = uint8(conv2(double(lena), double(filtr_usr), 'same'));
imshow(result)
title('Filtracja usredniajaca')

subplot(2, 3, 3)
imshow(imabsdiff(lena, result), [])
title('Roznica')

subplot(2, 3, 4)
imshow(result, [])
title('Oryginal')

subplot(2, 3, 5)
result = medfilt2(lenaSzum);
imshow(result, [])
title('Filtracja medianowa')

subplot(2, 3, 6)
imshow(imabsdiff(lenaSzum, result), [])
title('Roznica')

