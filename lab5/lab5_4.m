clear all; close all;

kw = imread('kw.bmp');
% Gradient Robertsa
R1 = [0, 0, 0; -1, 0, 0; 0, 1, 0];
R2 = [0, 0, 0; 0, 0, 1; 0, -1, 0];

figure(1)
result = uint8(conv2(double(kw), R1, 'same'));

subplot(1, 3, 1)
imshow(kw, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(result + 128, [])
title('128')

subplot(1, 3, 3)
imshow(abs(result), [])
title('abs')

figure(2)
result = uint8(conv2(double(kw), R2, 'same'));

subplot(1, 3, 1)
imshow(kw, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(result + 128, [])
title('128')

subplot(1, 3, 3)
imshow(abs(result), [])
title('abs')

% Gradient Prewitta
P1 = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
P2 = [-1, -1, -1; 0, 0, 0; 1, 1, 1];

figure(3)
result = uint8(conv2(double(kw), P1, 'same'));

subplot(1, 3, 1)
imshow(kw, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(result + 128, [])
title('128')

subplot(1, 3, 3)
imshow(abs(result), [])
title('abs')

figure(4)
result = uint8(conv2(double(kw), P2, 'same'));

subplot(1, 3, 1)
imshow(kw, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(result + 128, [])
title('128')

subplot(1, 3, 3)
imshow(abs(result), [])
title('abs')

% Gradient Sobela
S1 = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
S2 = [-1, -2, -1; 0, 0, 0; 1, 2, 1];

figure(5)
result = uint8(conv2(double(kw), S1, 'same'));

subplot(1, 3, 1)
imshow(kw, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(result + 128, [])
title('128')

subplot(1, 3, 3)
imshow(abs(result), [])
title('abs')

figure(6)
result = uint8(conv2(double(kw), S2, 'same'));

subplot(1, 3, 1)
imshow(kw, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(result + 128, [])
title('128')

subplot(1, 3, 3)
imshow(abs(result), [])
title('abs')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filtr kombinowany
filtr_komb = sqrt(S1.^2 + S2.^2);
figure(7)
result = uint8(conv2(double(kw), filtr_komb, 'same'));

subplot(1, 3, 1)
imshow(kw, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(result + 128, [])
title('128')

subplot(1, 3, 3)
imshow(abs(result), [])
title('abs')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filtr = (abs(S1)+abs(S2));
figure(8)
result = uint8(conv2(double(kw), filtr, 'same'));

subplot(1, 3, 1)
imshow(kw, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(result + 128, [])
title('128')

subplot(1, 3, 3)
imshow(abs(result), [])
title('abs')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
jet = imread('jet.bmp');
% kombinowany
filtr_komb = sqrt(S1.^2 + S2.^2)/9;

figure(9)
result = uint8(conv2(double(jet), filtr_komb, 'same'));

subplot(1, 3, 1)
imshow(jet, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(result + 128, [])
title('128')

subplot(1, 3, 3)
imshow(abs(result), [])
title('abs')

filtr = (abs(S1)+abs(S2))/9;
figure(10)
result = uint8(conv2(double(jet), filtr, 'same'));

subplot(1, 3, 1)
imshow(jet, [])
title('Oryginal')

subplot(1, 3, 2)
imshow(result + 128, [])
title('128')

subplot(1, 3, 3)
imshow(abs(result), [])
title('abs')
