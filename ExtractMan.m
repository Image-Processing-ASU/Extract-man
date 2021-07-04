function [ man ] = ExtractMan( image1 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
I=image1;
[h, w, c] = size(I);
figure,imshow(I);
s = zeros(h,w,c);
for i=1:h
    for j=1:w
        if I(i,j,1)<=50 &&I(i,j,2)<=100 && I(i,j,3)>=90
            continue;
        end
        if I(i,j,1)<=100 &&I(i,j,2)<=150 && I(i,j,3)>=150
            continue;
        end 
        if I(i,j,1)<=150 &&I(i,j,2)<=170 && I(i,j,3)>=190
            continue;
        end
        if I(i,j,1)<=150 &&I(i,j,2)<=150 && I(i,j,3)>=140 && I(i,j,3)<=175
            continue;
        end
        s(i,j,:)=I(i,j,:);
    end
end
img = medfilt1(s);
figure, imshow(img);
x = rgb2gray(img);
BW = edge(x,'canny');
figure, imshow(BW);
se = strel('square', 5);
BW = imdilate(BW,se);
figure,imshow(BW);
BW = ~BW;
figure,imshow(BW); 
[L, num] = bwlabel(BW);
RGB = label2rgb(L);
figure,imshow(RGB);
[h, w, ~] = size(I);
smallRatio = h*w*0.002;
x = uint8(L==3);
f = sum(sum(x==1));
if(f >= smallRatio)
    man = zeros(size(I));
    man(:,:,1) = uint8(x).*I(:,:,1);
    man(:,:,2) = uint8(x).*I(:,:,2);
    man(:,:,3) = uint8(x).*I(:,:,3);
end
end

