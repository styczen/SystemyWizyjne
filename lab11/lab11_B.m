% B.Transformata Hougha dla pojedynczego obiektu
clear all; close all;
%%
image = imread('kwadraty.tif');

figure
subplot(1, 3, 1)
imshow(image, [])
title('Kwadraty')

% Gradient Sobela do wykrywanie krawedzi
S1 = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
S2 = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
k1 = conv2(double(image), S1, 'same');
k2 = conv2(double(image), S2, 'same');
image = abs(k1) + abs(k2);
% image = sqrt(k1.^2 + k2.^2);
subplot(1, 3, 2)
imshow(image, [])
title('Wykrycie krawedzi')

[H, T, R] = hough(image);
subplot(1, 3, 3)
imshow(H, [])
title('Hough')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Houghlines

figure
I  = imread('kwadraty.tif');
% I = image;
BW = edge(I,'canny');
[H,T,R] = hough(BW);
imshow(H,[],'XData',T,'YData',R,...
            'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
P  = houghpeaks(H,9,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');
% Find lines and plot them
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

% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','blue');