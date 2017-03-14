close all; clear all;

kolo = imread('kolo.bmp');
kwadrat = imread('kwadrat.bmp');

kolo = boolean(kolo);
kwadrat = boolean(kwadrat);

figure(1)
imshow(kolo)

figure(2)
imshow(kwadrat)

figure(3)
subplot(2,2,1)
imshow(~kwadrat, [])

subplot(2,2,2)
imshow(kolo & kwadrat, [])

subplot(2,2,3)
imshow(kolo | kwadrat, [])

subplot(2,2,4)
imshow(xor(kolo, kwadrat), [])