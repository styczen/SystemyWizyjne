% C. Odwrotna dwuwymiarowa transformata Fouriera
clear all; close all

image = imread('kolo.bmp');

figure
subplot(1, 2, 1)
imshow(image, [])
title('Oryginal')

Y = fftshift(fft2(image));
Y = ifftshift(Y);
image_ = ifft2(Y);
subplot(1, 2, 2)
imshow(image_ - double(image), [])
% imshow(image_, [])
title('Roznica')


