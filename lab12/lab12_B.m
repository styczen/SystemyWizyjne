% B. Inne operacje morfologiczne - ścienianie (thinning), 
% szkieletyzacja (skeletonization), 
% rekonstrukcja morfologiczna (morphological reconstruction), 
% czyszczenie brzegu (clearing border)
% i uzupełnianie dziur (filling holes).

close all; clear all;

% scienianie
img = imread('fingerprint.bmp');

figure
subplot(1, 4, 1)
imshow(img, [])

BW2 = bwmorph(img, 'thin', 1);
subplot(1, 4, 2)
imshow(BW2, [])
title('1-krotne scienianie')

BW2 = bwmorph(img, 'thin', 2);
subplot(1, 4, 3)
imshow(BW2, [])
title('2-krotne scienianie')

BW2 = bwmorph(img, 'thin', Inf);
subplot(1, 4, 4)
imshow(BW2, [])
title('Inf-krotne scienianie')

% szkieletyzacja
img = imread('kosc.bmp');

figure
subplot(1, 2, 1)
imshow(img, [])

BW2 = bwmorph(img, 'skel', inf);
subplot(1, 2, 2)
imshow(BW2, [])

%% rekonstrukcja morfologiczna
img = imread('text.png');

r = 2;
c = 3;
figure
subplot(r, c, 1)
imshow(img, [])
% Otwarcie poprzez rekonstrukcje
SE = ones(51,1);
i = imopen(img, SE);
subplot(r, c, 2)
imshow(i, [])
% rekonstrukcja
i = imreconstruct(i, img);
subplot(r, c, 3)
imshow(i, [])
% Wypelnianie dziur
i = imfill(img, 'holes');
subplot(r, c, 4)
imshow(i, [])
% Czyszczenie brzegu
i = imclearborder(img);
subplot(r, c, 5)
imshow(i, [])