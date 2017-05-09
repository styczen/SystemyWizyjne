% Segmentacja przez podział i scalanie
clear all; close all;

rgb_image = imread('umbrealla.png');

figure(1)
imshow(rgb_image, []);

hsv_image = rgb2hsv(rgb_image); % konwersja z RGB na HSV

hsv_image_hpart = hsv_image(:,:,1);
[X, Y] = size(hsv_image_hpart);
global segRes trigger minimum index;
segRes = ones(X, Y);
index = 0;
trigger = 0.05;
minimum = 8;

set(0, 'RecursionLimit', 1000)
split(hsv_image_hpart, 1, 1, X, Y);
temp = ones(X, Y);
imshow(hsv_image_hpart, [])

