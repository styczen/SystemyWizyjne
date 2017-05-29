% C. Transformata Hougha dla obrazu rzeczywistego.
clear all; close all;

image = imread('lab112.bmp');
[X, Y, Z] = size(image);

figure
subplot(1, 2, 1)
imshow(image, [])
title('Oryginal')
% image_bin = im2bw(image);
image_bin = zeros(X, Y);

trigger = 50;

for i=1:X
    for j=1:Y    
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

filtered = uint8(bwlabel(image_bin,8));

% r = regionprops(filtered,'Centroid');
% for i=1:length(r)
%     text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
% end

wsp = obliczWspolczynniki(filtered);
for i = 1:X
   for j = 1:Y
        piksel = filtered(i,j);
        if piksel ~= 0 && ~(wsp(piksel,2) > 0.74 && wsp(piksel,2) < 0.8)
            filtered(i,j) = 0;
        end
   end
end

subplot(1, 2, 2)
imshow(filtered, [])
title('Binaryzaja')


I = filtered;
BW = edge(I,'canny');
[H,T,R] = hough(BW);
figure
imshow(H,[],'XData',T,'YData',R,...
            'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
P  = houghpeaks(H,8,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');
% Find lines and plot them
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
figure, imshow(image,[]), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','blue');

%% dla pliku dom.tif
clear all; close all;
I  = imread('dom.tif');

% BW = edge(rotI,'canny');
BW = edge(I,'zerocross','nothinning');

[H,T,R] = hough(BW);
imshow(H,[],'XData',T,'YData',R,...
            'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;

P  = houghpeaks(H,40,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');

lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
figure, imshow(I), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');
