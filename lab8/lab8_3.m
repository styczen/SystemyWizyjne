% Indeksacja rzeczywistego obrazu
% II. Rozpoznawanie obiektow za pomoca wspolczynnikow ksztaltu
% 2. Wspolczynniki ksztaltu
% 6.
clear all; close all;
image = imread('ksztaltyReal.bmp');
[XX, YY, ZZ] = size(image);

figure(1)
subplot(1, 3, 1)
imshow(image, [])
title('Oryginal')
% image_bin = im2bw(image);
image_bin = zeros(XX, YY);

trigger = 50;

for i=1:XX
    for j=1:YY    
        if image(i,j,1) < trigger && image(i,j,2) < trigger && image(i,j,3) < trigger
            image_bin(i,j) = 1;
        else
            image_bin(i,j) = 0;
        end
    end
end

% Wyostrzenie krawedzi
M = [1 2 1; 2 4 2; 1 2 1]; % macierz do wyostrzenia krawedzi
M = M/sum(sum(M)); % normalizacja
image_bin = conv2(image_bin, M, 'same');

subplot(1, 3, 2)
imshow(image_bin, [])
title('Binaryzaja')

filtered = uint8(bwlabel(image_bin,8));
r = regionprops(filtered,'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end

wsp = obliczWspolczynniki(filtered);
for i = 1:XX
   for j = 1:YY
        piksel = filtered(i,j);
        if piksel ~= 0 && ~(wsp(piksel,2) > 0.61 && wsp(piksel,2) < 0.66)
            filtered(i,j) = 0;
        end
   end
end

subplot(1, 3, 3)
imshow(filtered, [])
title('Krzyze - Rmin/Rmax')