% A. Histogram dla obrazów kolorowych
clear all; close all;

img = imread('lenaRGB.bmp');
lenaR = img(:,:,1);
lenaG = img(:,:,2);
lenaB = img(:,:,3);

figure
subplot(2, 4, 1)
imshow(img, [])
title('Oryginal')

subplot(2, 4, 2)
imshow(lenaR, [])
title('R')

subplot(2, 4, 3)
imshow(lenaG, [])
title('G')

subplot(2, 4, 4)
imshow(lenaB, [])
title('B')

subplot(2, 4, 6)
imhist(lenaR)
title('Hist - R')

subplot(2, 4, 7)
imhist(lenaG)
title('Hist - G')

subplot(2, 4, 8)
imhist(lenaB)
title('Hist - B')

% wyrownanie histogramu
Re = histeq(lenaR, 256);
Ge = histeq(lenaG, 256);
Be = histeq(lenaB, 256);

obrazEQ = img;
obrazEQ(:,:,1) = Re;
obrazEQ(:,:,2) = Ge;
obrazEQ(:,:,3) = Be;

figure
imshow(obrazEQ, [])
title('Po wyrownaniu histogramow skladowych')

% przeksztalcenie w skali HSV
img = rgb2hsv(img);
lenaR = img(:,:,1);
lenaG = img(:,:,2);
lenaB = img(:,:,3);

figure
subplot(2, 4, 1)
imshow(img, [])
title('Oryginal - HSV')

subplot(2, 4, 2)
imshow(lenaR, [])
title('H')

subplot(2, 4, 3)
imshow(lenaG, [])
title('S')

subplot(2, 4, 4)
imshow(lenaB, [])
title('V')

subplot(2, 4, 6)
imhist(lenaR)
title('Hist - H')

subplot(2, 4, 7)
imhist(lenaG)
title('Hist - S')

subplot(2, 4, 8)
imhist(lenaB)
title('Hist - V')

% wyrownanie histogramu
Re = histeq(lenaR, 256);
Ge = histeq(lenaG, 256);
Be = histeq(lenaB, 256);

obrazEQ = img;
obrazEQ(:,:,1) = Re;
obrazEQ(:,:,2) = Ge;
obrazEQ(:,:,3) = Be;

figure
obrazEQ = hsv2rgb(obrazEQ);
imshow(obrazEQ, [])
title('Po wyrownaniu histogramow skladowych - HSV')

% wyrownanie tylko skladowej V
img = imread('lenaRGB.bmp');
img = rgb2hsv(img);
lenaH = img(:,:,1);
lenaS = img(:,:,2);
lenaV = img(:,:,3);

lenaV = histeq(lenaV, 256);

obrazEQ = img;
obrazEQ(:,:,1) = lenaH;
obrazEQ(:,:,2) = lenaS;
obrazEQ(:,:,3) = lenaV;

figure
obrazEQ = hsv2rgb(obrazEQ);
imshow(obrazEQ, [])
title('Po wyrownaniu histogramow skladowej V')

%% obraz jezioro.jpg
img = imread('jezioro.jpg');
lenaR = img(:,:,1);
lenaG = img(:,:,2);
lenaB = img(:,:,3);

figure
subplot(2, 4, 1)
imshow(img, [])
title('Oryginal')

subplot(2, 4, 2)
imshow(lenaR, [])
title('R')

subplot(2, 4, 3)
imshow(lenaG, [])
title('G')

subplot(2, 4, 4)
imshow(lenaB, [])
title('B')

subplot(2, 4, 6)
imhist(lenaR)
title('Hist - R')

subplot(2, 4, 7)
imhist(lenaG)
title('Hist - G')

subplot(2, 4, 8)
imhist(lenaB)
title('Hist - B')

% wyrownanie histogramu
Re = histeq(lenaR, 256);
Ge = histeq(lenaG, 256);
Be = histeq(lenaB, 256);

obrazEQ = img;
obrazEQ(:,:,1) = Re;
obrazEQ(:,:,2) = Ge;
obrazEQ(:,:,3) = Be;

figure
imshow(obrazEQ, [])
title('Po wyrownaniu histogramow skladowych')

% przeksztalcenie w skali HSV
img = rgb2hsv(img);
lenaR = img(:,:,1);
lenaG = img(:,:,2);
lenaB = img(:,:,3);

figure
subplot(2, 4, 1)
imshow(img, [])
title('Oryginal - HSV')

subplot(2, 4, 2)
imshow(lenaR, [])
title('H')

subplot(2, 4, 3)
imshow(lenaG, [])
title('S')

subplot(2, 4, 4)
imshow(lenaB, [])
title('V')

subplot(2, 4, 6)
imhist(lenaR)
title('Hist - H')

subplot(2, 4, 7)
imhist(lenaG)
title('Hist - S')

subplot(2, 4, 8)
imhist(lenaB)
title('Hist - V')

% wyrownanie histogramu
Re = histeq(lenaR, 256);
Ge = histeq(lenaG, 256);
Be = histeq(lenaB, 256);

obrazEQ = img;
obrazEQ(:,:,1) = Re;
obrazEQ(:,:,2) = Ge;
obrazEQ(:,:,3) = Be;

figure
obrazEQ = hsv2rgb(obrazEQ);
imshow(obrazEQ, [])
title('Po wyrownaniu histogramow skladowych - HSV')

% wyrownanie tylko skladowej V
img = imread('jezioro.jpg');
img = rgb2hsv(img);
lenaH = img(:,:,1);
lenaS = img(:,:,2);
lenaV = img(:,:,3);

lenaV = histeq(lenaV, 256);

obrazEQ = img;
obrazEQ(:,:,1) = lenaH;
obrazEQ(:,:,2) = lenaS;
obrazEQ(:,:,3) = lenaV;

figure
obrazEQ = hsv2rgb(obrazEQ);
imshow(obrazEQ, [])
title('Po wyrownaniu histogramow skladowej V')