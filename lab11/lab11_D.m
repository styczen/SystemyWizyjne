% D.Transformata Hougha w przestrzeni ab
clear all; close all;

obraz = zeros(11, 1);
obraz(10, 10) = 1;

[H] = houghAB(obraz);

figure
subplot(1, 3, 1)
imshow(H, [])
title('Hough-jeden punkt')

obraz(1, 3) = 1;
[H] = houghAB(obraz);
subplot(1, 3, 2)
imshow(H, [])
title('Hough-dwa punkty')

obraz(2, 3) = 1;
obraz(3, 3) = 1;
[H] = houghAB(obraz);
subplot(1, 3, 3)
imshow(H, [])
title('Hough-punkty wspolliniowe')