% B. Metoda filtra odwrotnego
clear all; close all;

load inv_filter.mat
[x, y] = size(inv_filter);

figure
subplot(1, 4, 1)
imshow(inv_filter, [])
title('Oryginal')

f_img = fft2(inv_filter);
psf = fspecial('disk', 10);
f_psf = fft2(psf, x, y);
f_result = f_img ./ f_psf;
result = ifft2(f_result);
result = abs(result);

subplot(1, 4, 2)
imshow(result, []);
title('Inverse - disk, 10')

f_img = fft2(inv_filter);
psf = fspecial('disk', 15);
f_psf = fft2(psf, x, y);
f_result = f_img ./ f_psf;
result = ifft2(f_result);
result = abs(result);

subplot(1, 4, 3)
imshow(result, []);
title('Inverse - disk, 15')

f_img = fft2(inv_filter);
psf = fspecial('disk', 5);
f_psf = fft2(psf, x, y);
f_result = f_img ./ f_psf;
result = ifft2(f_result);
result = abs(result);

subplot(1, 4, 4)
imshow(result, []);
title('Inverse - disk, 5')


















