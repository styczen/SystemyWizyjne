% I. Indeksacja 
clear all; close all

obraz = imread('indeks1.bmp');
wynik = imread('indeksWynik1.bmp');

[XX, YY] = size(obraz);
L = 1; % etykieta poczatkowa
% Tablica sklejen
tabSkl= zeros(1,256);

for x = 2:XX-1
   for y = 2:YY-1
      if obraz(x, y) ~= 0
          sasiedzi = [obraz(x-1,y-1), obraz(x-1,y), ...
              obraz(x-1,y+1), obraz(x,y-1)];
          suma = sum(sasiedzi); 
          if suma == 0
              tabSkl(L) = L;
              obraz(x, y) = L;
              L = L + 1;
          elseif suma > 0
              sasiedzi = nonzeros(sasiedzi);
              min_ = min(sasiedzi);
              max_ = max(sasiedzi);
              obraz(x, y) = min_;
              tabSkl(max_) = min_;
          end
      end
   end
end

figure(1)
subplot(1, 3, 1)
imshow(obraz, [])
title('Wstepna indeksacja')

subplot(1, 3, 2)
imshow(wynik, [])
title('Porownanie')

for x = 2:XX-1
   for y = 2:YY-1
       if obraz(x, y) ~= 0
          obraz(x, y) = tabSkl(obraz(x, y)); 
       end
   end
end

subplot(1, 3, 3)
imshow(obraz, [])
title('Poprawna indeksacja')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
