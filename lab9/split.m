function [ mean_, std_ ] = split(image, x1, y1, x2, y2)
global segRes trigger minimum index;

temp = image(x1:x2, y1:y2);
mean_ = mean(temp(:));
std_ = std(temp(:));
[row, col] = size(temp);

if std_ > trigger && row > minimum && col > minimum
    split(image, x1, y1, round(x2/2), round(y2/2));
    split(image, x1, round(y2/2), round(x2/2), y2);
    split(image, round(x2/2), y1, x2, round(y2/2));
    split(image, round(x2/2), round(y2/2), x2, y2);
else
    index = index + 1;
    segReg(y1:y2, x1:x2) = index;
end

end