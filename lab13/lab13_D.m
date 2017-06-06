% D. Metoda filtracji Wienera
clear all; close all

img = imread('wiener_motion_noisy.png');

figure
subplot(1, 4, 1)
imshow(img, [])
title('Oryginal')

img = im2double(img);
PSF = fspecial('motion', 15, 0);

SNR = 70; % dB

% NSR = 1/SNR
NSR = 1/SNR;
J = deconvwnr(img, PSF, NSR);
subplot(1, 4, 2)
imshow(J, []);
title('1/SNR')

% NSR = wariancja_szumu / wariancja_obrazu
wariancja_szumu = 1.0046e-005;
wariancja_obrazu = var(img(:));
NSR = wariancja_szumu / wariancja_obrazu;
J = deconvwnr(img, PSF, NSR);
subplot(1, 4, 3)
imshow(J, []);
title('wariancja szumu / wariancja obrazu')

% NSR = 2*wariancja_obrazu
NSR = 2*wariancja_obrazu;
J = deconvwnr(img, PSF, NSR);
subplot(1, 4, 4)
imshow(J, []);
title('2*wariancja obrazu')



