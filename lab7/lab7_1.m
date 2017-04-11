% Segmentacja przez rozrost
clear all, close all;

obraz = imread('knee.png');
obraz = double(obraz);
figure(1)
imshow(obraz, [])
stos = zeros(10000, 2);
visited = uint8(zeros(779, 693));
segmented = uint8(zeros(779, 693));
[x, y] = ginput(1);
% x = 347; y = 287; % punkt startowy (zaokraglenie w dol)
x = floor(x); y = floor(y);
stos(1,1) = x; stos(1,2) = y;
visited(x,y) = 1; segmented(x,y) = 1;
threshold = 4;
% (j == stos(i,1)) && (k == stos(i,2)) || 
% petla
for i = 1:size(stos, 1)
   temp_x = stos(i,1); temp_y = stos(i,2);
   for  j = (stos(i,1)-1):1:(stos(i,1)+1)
      for k = (stos(i,2)-1):1:(stos(i,2)+1)
          if (j < 1) || (k < 1)
              continue
          end
          if visited(k,j) == 0
             if abs(obraz(k,j) - obraz(x,y)) < 100
                segmented(k,j) = 1; 
                stos(i+1, 1) = j; stos(i+1,2) = k;
             end
             visited(k,j) = 1;
          end

      end
   end
end

figure(2)
imshow(segmented, [])



