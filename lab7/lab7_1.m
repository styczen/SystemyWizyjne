% Segmentacja przez rozrost bez sredniej kroczacej
clear all, close all;

obraz = imread('knee.png');
obraz = double(obraz);
[img_x, img_y] = size(obraz);

figure(1)
imshow(obraz, [])

stos = zeros(10000, 2);
visited = zeros(img_x, img_y);
segmented = zeros(img_x, img_y);

[y_set, x_set] = ginput(1); % punkt setowy
x_set = floor(x_set); y_set = floor(y_set); % zaokraglenie do calkowitej wartosci

stos(1,1) = x_set; stos(1,2) = y_set;
i = 1; % wskaznik na szczyt stosu

visited(x_set,y_set) = 1; segmented(x_set,y_set) = 1;
threshold = 50;

% petla
while i ~= 0
   temp_x = stos(i,1); temp_y = stos(i,2);
   i = i - 1; % sciagniecie ze stosu
   for  j = (temp_x-1):(temp_x+1)
      for k = (temp_y-1):(temp_y+1)
          if visited(j,k) == 0
             if abs(obraz(j,k) - obraz(x_set,y_set)) < threshold
                segmented(j,k) = 1; 
                i = i + 1;
                stos(i, 1) = j; stos(i,2) = k;
             end
             visited(j,k) = 1;
          end
      end
   end
end

figure(2)
imshow(segmented, [])



