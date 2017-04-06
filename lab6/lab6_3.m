% Binaryzacja dwuprogowa
clear all, close all,

obraz = imread('bart.bmp');

figure(1)
subplot(1, 2, 1)
imshow(obraz, [])
title('Obrazek')

subplot(1, 2, 2)
imhist(obraz, 256)
title('Histogram')

progDolny = 192;
progGorny = 207;

obrazBW = obraz > progDolny & obraz < progGorny;
obrazBW = uint8(obrazBW);

figure(2)
subplot(1, 2, 1)
imshow(obraz, [])
title('Oryginal')

subplot(1, 2, 2)
imshow(obrazBW, [])
title('Binaryzacja dwuprogrowa')
