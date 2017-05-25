% A. Transformata Hougha dla malej ilosci punktow.
clear all; close all;

obraz = zeros(11, 1);
obraz(11, 11) = 1;

[H, T, R] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

figure
subplot(1, 3, 1)
imshow(H, [])
title('Hough-jeden punkt')

obraz(1, 3) = 1;
[H, T, R] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);
subplot(1, 3, 2)
imshow(H, [])
title('Hough-dwa punkty')

obraz(2, 4) = 1;
obraz(3, 5) = 1;
[H, T, R] = hough(obraz, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);
subplot(1, 3, 3)
imshow(H, [])
title('Hough-punkty wspolliniowe')