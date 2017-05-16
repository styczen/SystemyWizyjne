% A. Dwuwymiarowa transformata Fouriera

clear all; close all;

image = imread('dwieFale.bmp');

% Y = fft2(image);
Y = fftshift(fft2(image));

% % Filtr gornoprzepustowy
% M = [0 1 0; 1 -4 1; 0 1 0]; % maska
% M = M / 9; % normalizacja
% Y = conv2(double(Y), double(M), 'same');
% Y = 

figure
subplot(1, 3, 1)
imshow(image, [])
title('Oryginal')

subplot(1, 3, 2)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda')

subplot(1, 3, 3)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % kolo
% image = imread('kolo.bmp');
% Y = fftshift(fft2(image));
% figure
% subplot(1, 3, 1)
% imshow(image, [])
% title('Oryginal')
% 
% subplot(1, 3, 2)
% A = abs(Y);
% A = log10(A+1);
% imshow(A, []);
% title('Amplituda')
% 
% subplot(1, 3, 3)
% F = angle(Y.*(A>0.0001));
% imshow(F, []);
% title('Faza')
% 
% % kwadrat
% image = imread('kwadrat.bmp');
% Y = fftshift(fft2(image));
% figure
% subplot(1, 3, 1)
% imshow(image, [])
% title('Oryginal')
% 
% subplot(1, 3, 2)
% A = abs(Y);
% A = log10(A+1);
% imshow(A, []);
% title('Amplituda')
% 
% subplot(1, 3, 3)
% F = angle(Y.*(A>0.0001));
% imshow(F, []);
% title('Faza')
% 
% % kwadrat45
% image = imread('kwadrat45.bmp');
% Y = fftshift(fft2(image));
% figure
% subplot(1, 3, 1)
% imshow(image, [])
% title('Oryginal')
% 
% subplot(1, 3, 2)
% A = abs(Y);
% A = log10(A+1);
% imshow(A, []);
% title('Amplituda')
% 
% subplot(1, 3, 3)
% F = angle(Y.*(A>0.0001));
% imshow(F, []);
% title('Faza')
% 
% % trojkat
% image = imread('trojkat.bmp');
% Y = fftshift(fft2(image));
% figure
% subplot(1, 3, 1)
% imshow(image, [])
% title('Oryginal')
% 
% subplot(1, 3, 2)
% A = abs(Y);
% A = log10(A+1);
% imshow(A, []);
% title('Amplituda')
% 
% subplot(1, 3, 3)
% F = angle(Y.*(A>0.0001));
% imshow(F, []);
% title('Faza')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; close all;
% kolo
image = imread('kolo.bmp');
F1 = fft(image, [], 1);
F2 = fft(F1, [], 2);
Y = fftshift(F2 - F1);
figure
subplot(2, 3, 1)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 2)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda nowe')

subplot(2, 3, 3)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza nowe')

Y = fftshift(fft2(image));
subplot(2, 3, 4)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 5)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda')

subplot(2, 3, 6)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza')

% kwadrat
image = imread('kwadrat.bmp');
F1 = fft(image, [], 1);
F2 = fft(F1, [], 2);
Y = fftshift(F2 - F1);
figure
subplot(2, 3, 1)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 2)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda nowe')

subplot(2, 3, 3)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza nowe')

Y = fftshift(fft2(image));
subplot(2, 3, 4)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 5)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda')

subplot(2, 3, 6)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza')

% kwadrat45
image = imread('kwadrat45.bmp');
F1 = fft(image, [], 1);
F2 = fft(F1, [], 2);
Y = fftshift(F2 - F1);
figure
subplot(2, 3, 1)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 2)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda nowe')

subplot(2, 3, 3)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza nowe')

Y = fftshift(fft2(image));
subplot(2, 3, 4)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 5)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda')

subplot(2, 3, 6)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza')

% trojkat
image = imread('trojkat.bmp');
F1 = fft(image, [], 1);
F2 = fft(F1, [], 2);
Y = fftshift(F2 - F1);
figure
subplot(2, 3, 1)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 2)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda nowe')

subplot(2, 3, 3)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza nowe')

Y = fftshift(fft2(image));
subplot(2, 3, 4)
imshow(image, [])
title('Oryginal')

subplot(2, 3, 5)
A = abs(Y);
A = log10(A+1);
imshow(A, []);
title('Amplituda')

subplot(2, 3, 6)
F = angle(Y.*(A>0.0001));
imshow(F, []);
title('Faza')