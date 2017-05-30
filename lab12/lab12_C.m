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
imshow(i, [])
title('otwarcie')

subplot(1, 3, 3)
i = imclose(img, SE);
imshow(i, [])
title('zamkniecie')

% top, bottom hat dla ferrari.bmp
% SE = strel('disk', 1);
figure
subplot(1, 3, 1)
imshow(img, [])

subplot(1, 3, 2)
i = imtophat(img, SE);
imshow(i, [])
title('top-hat')

subplot(1, 3, 3)
i = imbothat(img, SE);
imshow(i, [])
title('bottom-hat')

% top-hat i bottom-hat
img = imread('rice.png');

SE = strel('disk', 10);
figure
subplot(1, 2, 1)
imshow(img, [])

subplot(1, 2, 2)
i = imtophat(img, SE);
imshow(i, []);
title('top-hat')