close all; clear all;
load funkcjeLUT
figure(1)
plot(kwadratowa);
% Wczytanie obrazu jet.bmp
jet = imread('jet.bmp');
figure(2)
imshow(jet)

jet_lut = intlut(jet, kwadratowa);
figure(3)
imshow(jet_lut)

% Wlasna funkcja
figure(4)
LUT(jet, kwadratowa)

figure(5)
LUT(jet, wykladnicza)

figure(6)
LUT(jet, pierwiastkowa)

figure(7)
LUT(jet, odwrotna)

figure(8)
LUT(jet, pila)

figure(9)
LUT(jet, odwlog)

figure(10)
LUT(jet, ex)