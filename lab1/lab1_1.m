clear all, close all

% Wczytanie informacji o obrazkach
info_bmp = imfinfo('lena.bmp');
info_jpg = imfinfo('lena.jpg');

% Wczytanie obrazków do przestrzeni roboczej
bmp = imread('lena.bmp');
jpg = imread('lena.jpg');

% Wyswietlnie obrazka w formacie bmp
figure(1)
imshow(bmp);

% Wyswietlnie obrazka w formacie jpg
figure(2);
imshow(jpg);

% Konwersja obrazu 'lena.jpg' do skali szarosci
lena_gray = rgb2gray(jpg);
figure(3);
imshow(lena_gray);

% Zapisanie do pliku 'lena_gray.bmp'
imwrite(lena_gray, 'lena_gray.bmp');

% Wyswietlenie na wykresie 3D
figure(4);
colormap gray;
mesh(double(lena_gray));

% Przekroj przez 10 wiersz
figure(5);
plot(lena_gray(10, :));

% Przekroj przez 19 kolumn
figure(6);
plot(lena_gray(:, 19));