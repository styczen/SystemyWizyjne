% B. Filtracja górnoprzepustowa obrazów kolorowych.
clear all; close all;

load maskiPP.mat

img = imread('lenaRGB.bmp');
lenaR = img(:,:,1);
lenaG = img(:,:,2);
lenaB = img(:,:,3);

lenaR1 = conv2(double(lenaR), S1, 'same');
lenaR2 = conv2(double(lenaR), S2, 'same');
lenaR_f = sqrt(lenaR1.^2 + lenaR2.^2);
% lenaR_f = lenaR_f + 128;
% lenaR_f = abs(lenaR_f);

lenaG1 = conv2(double(lenaG), S1, 'same');
lenaG2 = conv2(double(lenaG), S2, 'same');
lenaG_f = sqrt(lenaG1.^2 + lenaG2.^2);
% lenaG_f = lenaG_f + 128;
% lenaG_f = abs(lenaG_f);

lenaB1 = conv2(double(lenaB), S1, 'same');
lenaB2 = conv2(double(lenaB), S2, 'same');
lenaB_f = sqrt(lenaB1.^2 + lenaB2.^2);
% lenaB_f = lenaB_f + 128;
% lenaB_f = abs(lenaB_f);

lena = img;
lena(:,:,1) = lenaR_f;
lena(:,:,2) = lenaG_f;
lena(:,:,3) = lenaB_f;

figure
subplot(1, 4, 1)
imshow(lena, [])
title('Wynik')

subplot(1, 4, 2)
imshow(lenaR_f, [])
title('R')

subplot(1, 4, 3)
imshow(lenaG_f, [])
title('G')

subplot(1, 4, 4)
imshow(lenaB_f, [])
title('B')

%% HSV
load maskiPP.mat
img = imread('lenaRGB.bmp');
lenaHSV = rgb2hsv(img);
lenaH = lenaHSV(:,:,1);
lenaS = lenaHSV(:,:,2);
lenaV = lenaHSV(:,:,3);

lenaH1 = conv2(double(lenaH), S1, 'same');
lenaH2 = conv2(double(lenaH), S2, 'same');
lenaH_f = sqrt(lenaH1.^2 + lenaH2.^2);
% lenaH_f = lenaH_f + 128;
% lenaH_f = abs(lenaH_f);

lenaS1 = conv2(double(lenaS), S1, 'same');
lenaS2 = conv2(double(lenaS), S2, 'same');
lenaS_f = sqrt(lenaS1.^2 + lenaS2.^2);
% lenaS_f = lenaS_f + 128;
% lenaS_f = abs(lenaS_f);

lenaV1 = conv2(double(lenaV), S1, 'same');
lenaV2 = conv2(double(lenaV), S2, 'same');
lenaV_f = sqrt(lenaV1.^2 + lenaV2.^2);
% lenaV_f = lenaV_f + 128;
% lenaV_f = abs(lenaV_f);

lenaHSVr = img;
lenaHSVr(:,:,1) = lenaH_f;
lenaHSVr(:,:,2) = lenaS_f;
lenaHSVr(:,:,3) = lenaV_f;

lenaHSV2RGB = hsv2rgb(single(lenaHSVr));
figure
subplot(1, 4, 1)
imshow(lenaHSV2RGB, [])
title('Wynik')

subplot(1, 4, 2)
imshow(lenaH_f, [])
title('H')

subplot(1, 4, 3)
imshow(lenaS_f, [])
title('S')

subplot(1, 4, 4)
imshow(lenaV_f, [])
title('V')

%% suma skladowych RGB
lenaRGB = lenaR_f + lenaG_f + lenaB_f;
lenaHSV = lenaH_f + lenaS_f + lenaV_f;
% lenaHSV2RGB = hsv2rgb(double(lenaHSV));

figure
subplot(1, 2, 1)
imshow(lenaRGB, [])
title('RGB')

subplot(1, 2, 2)
imshow(lenaHSV, [])
title('HSV')