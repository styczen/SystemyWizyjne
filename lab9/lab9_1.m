% Segmentacja przez podzial i scalanie

clear all; close all;

global trigger minimum index segRes mean_table;

rgb_image = imread('umbrealla.png');

figure
imshow(rgb_image);
title('Oryginal')

hsv_image = double(rgb2hsv(rgb_image));
h_image = hsv_image(:,:,1);

[X, Y] = size(h_image);

mean_table = zeros(X, Y);
index = 1;
trigger_merge = 0.03;
segRes = zeros(X, Y);
trigger = 0.02;
minimum = 4;
split(h_image, 1, 1, X, Y);

figure
imshow(mean_table, []);
title('Mean table')


for i_index = 1:index
    
    IB = segRes == i_index;
    IBDilate = imdilate(IB,strel('square',3));
    IBDiff = IBDilate - IB;
    IBMult = IBDiff.*segRes;
    IBMultNZ = nonzeros(IBMult);
    IBUnique = unique(IBMultNZ);
    
    for i = 1:length(IBUnique)
        IBS = segRes == IBUnique(i);
        [y_IBS , x_IBS] = find(IBS, 1 , 'first');
        [y_IB, x_IB] = find(IB, 1, 'first');
        if abs(mean_table(y_IBS, x_IBS) - mean_table(y_IB, x_IB)) < trigger_merge
            segRes(IBS) = i_index;
        end
    end
end

figure
imshow(label2rgb(segRes), []);
% imshow(segRes, []);
title('Segmented')