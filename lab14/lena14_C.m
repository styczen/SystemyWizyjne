% C. Filtracja dolnoprzepustowa obrazów kolorowych.
clear all; close all;

img = imread('lenaRGBSzumKolor.bmp');
lenaR = img(:,:,1);
lenaG = img(:,:,2);
lenaB = img(:,:,3);

% filtracja usredniajaca
h = fspecial('average', 8);
lenaR_f = imfilter(lenaR, h);
lenaG_f = imfilter(lenaG, h);
lenaB_f = imfilter(lenaB, h);

lena = img;
lena(:,:,1) = lenaR_f;
lena(:,:,2) = lenaG_f;
lena(:,:,3) = lenaB_f;

% dla HSV
lenaHSV = double(rgb2hsv(img));
lenaH = lenaHSV(:,:,1);
lenaS = lenaHSV(:,:,2);
lenaV = lenaHSV(:,:,3);

lenaH_f = imfilter(lenaH, h);
lenaS_f = imfilter(lenaS, h);
lenaV_f = imfilter(lenaV, h);

lenaHSV = double(img);
lenaHSV(:,:,1) = lenaH_f;
lenaHSV(:,:,2) = lenaS_f;
lenaHSV(:,:,3) = lenaV_f;

figure
subplot(1, 2, 1)
imshow(lena, [])
title('RGB')

subplot(1, 2, 2)
imshow(hsv2rgb(lenaHSV), [])
title('HSV')