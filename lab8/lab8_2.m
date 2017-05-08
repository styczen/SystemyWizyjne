% II. Rozpoznawanie obiektow za pomoca wspolczynnika ksztaltu
clear all; close all

% 1. Indeksacja wbudowana w IPT Matlab'a
obraz = imread('ksztalty.bmp');

figure(1)
subplot(1, 3, 1)
imshow(obraz, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(bwlabel(obraz, 4), [])
title('4 sasiadow')

subplot(1, 3, 3)
imshow(bwlabel(obraz, 8), [])
title('8 sasiadow')

% 2. Wspolczynniki ksztaltu
figure(2)
labeled = bwlabel(obraz, 8);
imshow(labeled, [])

wsp = obliczWspolczynniki(labeled);
[XX, YY] = size(labeled);

figure(3)
subplot(2, 3, 1)
imshow(labeled, [])
title('Oryginal')
r = regionprops(labeled,'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end

subplot(2, 3, 2)
labeled = uint8(bwlabel(obraz, 8));
for i = 1:XX
   for j = 1:YY
        piksel = labeled(i,j);
        if piksel ~= 0 && ~(wsp(piksel,1) > 0.77 && wsp(piksel,1) < 0.79) % kolo 1 i 6
            labeled(i,j) = 0;
        end
   end
end
imshow(labeled, [])
title('Compactness')
r = regionprops(labeled,'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end

subplot(2, 3, 3)
labeled = bwlabel(obraz, 8);
for i = 1:XX
   for j = 1:YY
        piksel = labeled(i,j);
        if piksel ~= 0 && ~(wsp(piksel,2) > 0.51 && wsp(piksel,2) < 0.53) % krzyzyk 2, 5, 8
            labeled(i,j) = 0;
        end
   end
end
imshow(labeled, [])
title('Rmin/Rmax')
r = regionprops(labeled,'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end

subplot(2, 3, 4)
labeled = bwlabel(obraz, 8);
for i = 1:XX
   for j = 1:YY
        piksel = labeled(i,j);
        if piksel ~= 0 && ~(wsp(piksel,3) > 6.76 && wsp(piksel,3) < 6.82) % kwadrat 3, 4, 7
            labeled(i,j) = 0;
        end
   end
end
imshow(labeled, [])
title('Blair - Bliss')
r = regionprops(labeled,'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end

subplot(2, 3, 5)
labeled = bwlabel(obraz, 8);
for i = 1:XX
   for j = 1:YY
        piksel = labeled(i,j);
        if piksel ~= 0 && ~(wsp(piksel,4) > 0.995 && wsp(piksel,4) < 1.1) % kolo 1, 6
            labeled(i,j) = 0;
        end
   end
end
imshow(labeled, [])
title('Haralick')
r = regionprops(labeled,'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end

subplot(2, 3, 6)
labeled = bwlabel(obraz, 8);
for i = 1:XX
   for j = 1:YY
        piksel = labeled(i,j);
        if piksel ~= 0 && ~(wsp(piksel,5) > 0.01 && wsp(piksel,5) < 0.02) % krzyz 2, 5, 8
            labeled(i,j) = 0;
        end
   end
end
imshow(labeled, [])
title('M7')
r = regionprops(labeled,'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end



