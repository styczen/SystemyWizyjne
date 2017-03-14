function LUT(obraz, przekodowanie)
obraz_przek = intlut(obraz, przekodowanie);

subplot(2,2,1:2)
plot(przekodowanie)
title('Przekodowanie')

subplot(2,2,3)
imshow(obraz, [])
title('Oryginal')

subplot(2,2,4)
imshow(obraz_przek, [])
title('Obraz przekodowany')
end