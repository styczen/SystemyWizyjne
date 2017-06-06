% C. Metoda filtra pseudoodwrotnego
clear all; close all;

load inv_filter_noisy
[x, y] = size(inv_filter_noisy);

figure
subplot(1, 2, 1)
imshow(inv_filter_noisy, [])

f_img = fft2(inv_filter_noisy);
psf = fspecial('disk', 10);
f_psf = fft2(psf, x, y);
f_result = f_img ./ f_psf;
result = ifft2(f_result);
result = abs(result);

subplot(1, 2, 2)
imshow(result, []);
title('Inverse - disk, 10')

figure(2)
surf(fftshift(abs(f_psf))), shading interp

f_result(abs(f_psf) < 0.01) = 0;
result = ifft2(f_result);
result = abs(result);

figure
subplot(1, 2, 1)
imshow(inv_filter_noisy, [])
subplot(1, 2, 2)
imshow(result, [])
