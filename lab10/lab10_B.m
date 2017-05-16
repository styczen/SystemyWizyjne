% B. Wlasnosci dwuwymiarowej transformaty Fouriera
clear all; close all

% kwadrat
image = imread('kwadrat.bmp');
Y = fftshift(fft2(image));
figure
subplot(2, 3, 1)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 2)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda')

subplot(2, 3, 3)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza')

image = imread('kwadratT.bmp');
Y = fftshift(fft2(image));
subplot(2, 3, 4)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 5)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda nowe')

subplot(2, 3, 6)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza nowe')

% kwadrat kolejne
image = imread('kwadrat.bmp');
Y = fftshift(fft2(image));
figure
subplot(2, 3, 1)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 2)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda')

subplot(2, 3, 3)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza')

image = imread('kwadratS.bmp');
Y = fftshift(fft2(image));
subplot(2, 3, 4)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 5)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda nowe')

subplot(2, 3, 6)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza nowe')

% kwadrat kolejne kolejne
image = imread('kwadrat.bmp');
Y = fftshift(fft2(image));
figure
subplot(2, 3, 1)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 2)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda')

subplot(2, 3, 3)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza')

image = imread('kwadrat45.bmp');
Y = fftshift(fft2(image));
subplot(2, 3, 4)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 5)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda 45')

subplot(2, 3, 6)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza 45')

image = imread('kwadratKL.bmp');
Y = fftshift(fft2(image));
subplot(2, 3, 4)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 5)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda KL')

subplot(2, 3, 6)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza KL')

% kwadrat kolejne
image = imread('kwadrat.bmp');
Y = fftshift(fft2(image));
figure
subplot(2, 3, 1)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 2)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda')

subplot(2, 3, 3)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza')

image = imread('kwadrat45.bmp');
Y = fftshift(fft2(image));
subplot(2, 3, 4)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 5)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda nowe 45')

subplot(2, 3, 6)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza nowe 45')