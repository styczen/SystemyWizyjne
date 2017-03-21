clear all; close all;

% 1.
lena1 = imread('lena1.bmp');
lena2 = imread('lena2.bmp');
lena3 = imread('lena3.bmp');
lena4 = imread('lena4.bmp');

figure(1)
subplot(4, 2, 1)
imshow(lena1, [])
subplot(4, 2, 2)
imhist(lena1, 256)

subplot(4, 2, 3)
imshow(lena2, [])
subplot(4, 2, 4)
imhist(lena2, 256)

subplot(4, 2, 5)
imshow(lena3, [])
subplot(4, 2, 6)
imhist(lena3, 256)

subplot(4, 2, 7)
imshow(lena4, [])
subplot(4, 2, 8)
imhist(lena4, 256)

% 3.
hist1 = imread('hist1.bmp');
figure(2)
subplot(1, 2, 1)
imshow(hist1, [])
subplot(1, 2, 2)
imhist(hist1, 256)
% rozciagniecie
hist1_adjust = imadjust(hist1);
figure(3)
subplot(1, 2, 1)
imshow(hist1_adjust, [])
subplot(1, 2, 2)
imhist(hist1_adjust, 256)

% 7.
hist1 = imread('hist1.bmp');
figure(4)
[H, x] = imhist(hist1_adjust);
C = cumsum(H);
k = max(C) / max(H);
C2 = C / k; % histogram skumulowany
plot(x, H)
hold on
plot(x, C2)
hold off

% 9.
figure(5)
scale = max(C2) / 256;
C2_scale = uint8(C2 / scale);
subplot(3, 1, 1)
imshow(intlut(imadjust(hist1), C2_scale))
subplot(3, 1, 2)
imhist(imadjust(hist1))
subplot(3, 1, 3)
plot(x, C2_scale)

% 12.
figure(6)
subplot(3, 1, 1)
imshow(histeq(hist1, 256))
subplot(3, 1, 2)
imshow(adapthisteq(hist1))
subplot(3, 1, 3)
imshow(hist1)

% 13.
hist2 = imread('hist2.bmp');
hist3 = imread('hist3.bmp');
hist4 = imread('hist4.bmp');

figure(7)
subplot(4, 1, 1)
imshow(hist2)
subplot(4, 1, 2)
imshow(imadjust(hist2))
subplot(4, 1, 3)
histeq(hist2)
subplot(4, 1, 4)
imshow(adapthisteq(hist2))

figure(8)
subplot(4, 1, 1)
imshow(hist3)
subplot(4, 1, 2)
imshow(imadjust(hist3))
subplot(4, 1, 3)
histeq(hist3)
subplot(4, 1, 4)
imshow(adapthisteq(hist3))

figure(9)
subplot(4, 1, 1)
imshow(hist4)
subplot(4, 1, 2)
imshow(imadjust(hist4))
subplot(4, 1, 3)
histeq(hist4)
subplot(4, 1, 4)
imshow(adapthisteq(hist4))