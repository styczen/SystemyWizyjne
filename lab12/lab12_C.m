% C. Operacje morfologiczne dla obrazow w skali szarosci.
clear all; close all;

img = imread('ferrari.bmp');

SE = strel('square', 3);
i = imerode(img, SE);
figure
subplot(1, 3, 1)
imshow(img, [])

subplot(1, 3, 2)
imshow(i, [])
title('erozja')

subplot(1, 3, 3)
i = imdilate(img, SE);
imshow(i, [])
title('dylatacja')

% otwarcie i zamkniecie
figure
subplot(1, 3, 1)
imshow(img, [])

subplot(1, 3, 2)
i = imopen(img, SE);
imshow(