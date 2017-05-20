% E.Implementacja wyszukiwania wzorca za pomoc? FFT
clear all; close all;

literki = imread('literki.bmp');
wzorA = imread('wzorA.bmp');

figure
subplot(1, 2, 1)
imshow(literki, [])
title('Literki')

subplot(1, 2, 2)
imshow(wzorA, [])
title('WzorA')

literkiF = fftshift(fft2(literki)); % Fourier z przesunieciem
wzorAF = fftshift(fft2(rot90(wzorA,2),256,256)); % Fourier z przesunieciem

imgF = literkiF .* wzorAF;
img = ifft2(ifftshift(imgF)); % odwrotny Fourier
SE = strel('square', 3);
img_tophat = imtophat(img, SE);
figure
imshow(img_tophat, [])
