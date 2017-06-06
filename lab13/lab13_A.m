% A. Filtracja w obszarze ROI
clear all; close all;

img = imread('tetniak_aorty.png');

figure
subplot(1, 2, 1)
handler_img = imshow(img, []);
title('Oryginal')

h = imellipse(gca, [220 100 260 170]);
mask = createMask(h, handler_img);
sharp_filtr = fspecial('unsharp');
img_filtered = roifilt2(sharp_filtr, img, mask);

subplot(1, 2, 2)
imshow(img_filtered, [])
title('Filtered')

uchwyt = @(img) imadjust(img, [0.5, 0.7], [0.0, 1.0]);

figure
subplot(1, 2, 1)
handler_img = imshow(img, []);
title('Oryginal')

h = imellipse(gca, [220 100 260 170]);
img_filtered = roifilt2(img, mask, uchwyt);

subplot(1, 2, 2)
imshow(img_filtered, [])
title('Filtered')

