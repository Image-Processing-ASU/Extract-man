function [ out ] = AddMan( image2,man )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
[h, w, c] = size(image2);
R = imresize(man, [h,w]);
s = zeros(size(R));
for i=1:h
    for j=1:w
        if R(i,j,1)<1&& R(i,j,2)<1 && R(i,j,3)<1
            s(i,j,:)= image2(i,j,:);
        else
             s(i,j,:)= R(i,j,:);
        end
    end
end
out=s;
end

