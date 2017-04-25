% Segmentacja przez rozrost ze srednia kroczaca i ladnym wyswietlaniem
clear all, close all;

obraz = imread('knee.png');
obraz = double(obraz);
[img_x, img_y] = size(obraz);

figure(1)
imshow(obraz, [])

stos = zeros(10000, 2);
visited = zeros(img_x, img_y);
segmented = zeros(img_x, img_y);

visited(:, 1) = 1; visited(:, img_y) = 1;
visited(1, :) = 1; visited(img_x, :) = 1;

[y_set, x_set] = ginput(1); % punkt setowy
x_set = floor(x_set); y_set = floor(y_set); % zaokraglenie do calkowitej wartosci

stos(1,1) = x_set; stos(1,2) = y_set;
i = 1; % wskaznik na szczyt stosu

visited(x_set,y_set) = 1; segmented(x_set,y_set) = 1;
threshold = 50;

draw_iter = 1;
n=1;
mean = obraz(x_set, y_set);
% petla
while i ~= 0
   temp_x = stos(i,1); temp_y = stos(i,2);
   i = i - 1; % sciagniecie ze stosu
   for  j = (temp_x-1):(temp_x+1)
      for k = (temp_y-1):(temp_y+1)
          if (k < 1) || (j < 1)
              break
          end
          if visited(j,k) == 0                           
             if abs(obraz(j,k) - mean) < threshold
                n=n+1;
                mean = (mean*(n-1)+obraz(j,k))/n; 
                segmented(j,k) = 1; 
                i = i + 1;
                stos(i, 1) = j; stos(i,2) = k;
             end
             visited(j,k) = 1;
          end
      end
   end
   if draw_iter == 1000
       imshow(obraz.*segmented, [])
       drawnow
       draw_iter = 0;
   end
   draw_iter = draw_iter + 1;
end

matrix = fspecial('gaussian');
% figure(2)
imshow(imfilter(obraz.*segmented, matrix), [])
% imshow(segmented, [])