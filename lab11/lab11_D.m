% D.Transformata Hougha w przestrzeni ab
clear all; close all;

obraz = zeros(11, 11);
obraz(10, 10) = 1;

[H] = houghAB(obraz);

figure
subplot(2, 3, 1)
imshow(obraz, [])
subplot(2, 3, 4)
imshow(H, [])
title('Hough-jeden punkt')

obraz(1, 3) = 1;
[H] = houghAB(obraz);
subplot(2, 3, 2)
imshow(obraz, [])
subplot(2, 3, 5)
imshow(H, [])
title('Hough-dwa punkty')

obraz(2, 3) = 1;
obraz(4, 3) = 1;

[H] = houghAB(obraz);
subplot(2, 3, 3)
imshow(obraz, [])
subplot(2, 3, 6)
imshow(H, [])
title('Hough-punkty wspolliniowe')