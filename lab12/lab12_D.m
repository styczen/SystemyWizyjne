% D. Przyk?ad zastosowania morfologii.
clear all; close all;

img = imread('calculator.png');

figure
subplot(2, 3, 1)
imshow(img, [])
title('oryginal')

% likwidacja odblaskow poziomych
line = ones(1, 71);
i = imerode(img, line);
i = imreconstruct(i, img);

subplot(2, 3, 2)
imshow(i, [])

i = img - i; 
subplot(2, 3, 3)
imshow(i, [])
temp = i;

% klasyczne otwarcie - do porownania
i_klas = imopen(img, line);
i_klas = img - i_klas;
subplot(2, 3, 4)
imshow(i_klas, [])

% likwidacja odblaskow pionowych
line = ones(1, 11);
i_ = imerode(i, line);
i_ = imreconstruct(i_, i);
subplot(2, 3, 5)
imshow(i_, [])

% dodanie elementow pionowych, ktore mialy pozostac
ele = ones(1, 21);
i_ = imdilate(i_, ele);
im = imreconstruct(min(i_, temp), temp);
subplot(2, 3, 6)
imshow(im, [])

