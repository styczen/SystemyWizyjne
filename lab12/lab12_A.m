% A. Podstawowe operacje morfologiczne: erozja, dylatacja, otwarcie, zamknięcie, trafi nie trafi.
clear all; close all;
img = imread('ertka.bmp');

% square
SE = strel('square', 3);
IM2 = imerode(img, SE);
figure
subplot(1, 2, 1)
imshow(img, [])
subplot(1, 2, 2)
imshow(IM2, [])
title('square - 3 pixels')

% diamond
SE = strel('diamond', 2);
IM2 = imerode(img, SE);
figure
subplot(1, 2, 1)
imshow(img, [])
subplot(1, 2, 2)
imshow(IM2, [])
title('diamond - 2')

% 2 - krotna erozja kwadratem
SE = strel('square', 3);
IM2 = imerode(img, SE);
IM2 = imerode(IM2, SE);
figure
subplot(1, 2, 1)
imshow(img, [])
subplot(1, 2, 2)
imshow(IM2, [])
title('2 * square - 3 pixels')

% 3 - krotna erozja kwadratem
SE = strel('square', 3);
IM2 = imerode(img, SE);
IM2 = imerode(IM2, SE);
IM2 = imerode(IM2, SE);
figure
subplot(1, 2, 1)
imshow(img, [])
subplot(1, 2, 2)
imshow(IM2, [])
title('3 * square - 3 pixels')

% buska
img = imread('buska.bmp');
figure
subplot(1, 2, 1)
imshow(img, [])
SE = [1 0 1;
      0 1 0;
      1 0 1];
IM2 = imerode(img, SE);
subplot(1, 2, 2)
imshow(IM2, []);

% dylatacja (czasu)
img = imread('ertka.bmp');
SE = strel('square', 3);
IM2 = imdilate(img, SE);
figure
imshow(IM2, [])


%% erozja, dylatacja, otwarcie zamkniecie
% ertka.bmp
clear all; close all;
img = imread('ertka.bmp');
figure
subplot(1, 5, 1)
imshow(img, [])
title('oryginal')

SE = strel('square', 3);
IM2 = imerode(img, SE);
subplot(1, 5, 2)
imshow(IM2, [])
title('erozja')

IM2 = imdilate(img, SE);
subplot(1, 5, 3)
imshow(IM2, [])
title('dylatacja')

IM2 = imopen(img, SE);
subplot(1, 5, 4)
imshow(IM2, [])
title('otwarcie')

IM2 = imclose(img, SE);
subplot(1, 5, 5)
imshow(IM2, [])
title('zamkniecie')

% wyspa.bmp
img = imread('wyspa.bmp');
figure
subplot(1, 5, 1)
imshow(img, [])
title('oryginal')

SE = strel('square', 3);
IM2 = imerode(img, SE);
subplot(1, 5, 2)
imshow(IM2, [])
title('erozja')

IM2 = imdilate(img, SE);
subplot(1, 5, 3)
imshow(IM2, [])
title('dylatacja')

IM2 = imopen(img, SE);
subplot(1, 5, 4)
imshow(IM2, [])
title('otwarcie')

IM2 = imclose(img, SE);
subplot(1, 5, 5)
imshow(IM2, [])
title('zamkniecie')

% kolka.bmp
img = imread('kolka.bmp');
figure
subplot(1, 5, 1)
imshow(img, [])
title('oryginal')

SE = strel('square', 3);
IM2 = imerode(img, SE);
subplot(1, 5, 2)
imshow(IM2, [])
title('erozja')

IM2 = imdilate(img, SE);
subplot(1, 5, 3)
imshow(IM2, [])
title('dylatacja')

IM2 = imopen(img, SE);
subplot(1, 5, 4)
imshow(IM2, [])
title('otwarcie')

IM2 = imclose(img, SE);
subplot(1, 5, 5)
imshow(IM2, [])
title('zamkniecie')

%% wyeliminaowanie wypustek i dziur w obrazie ertka.bmp
clear all; close all;

img = imread('ertka.bmp');
SE = strel('diamond', 1);
IM2 = imopen(img, SE);
IM2 = imclose(IM2, SE);
figure
subplot(1, 2, 1)
imshow(img, [])

subplot(1, 2, 2)
imshow(IM2, [])

%% analiza obrazka hom.bmp
img = imread('hom.bmp');

SE1 = [ 0 1 0; 1 1 1; 0 1 0]; % to, co chcemy wykryc
SE2 = [ 1 0 1; 0 0 0; 1 0 1]; % dopelnienie maski SE2

BW2 = bwhitmiss(img, SE1, SE2);
figure
subplot(1, 2, 1)
imshow(img, [])

subplot(1, 2, 2)
imshow(BW2, [])