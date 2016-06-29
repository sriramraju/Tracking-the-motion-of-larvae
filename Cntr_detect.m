function Cntr = Cntr_detect(im)

k1 = im(:,:,1);
k2 = im(:,:,2);
k3 = im(:,:,3);

k4 = k1 - k2;
k5 = k1 - k3;
k6 = k2 - k3;

k5 = histeq(k5);
k51 = k5;
k5 = im2bw(k5,graythresh(k5));

[q1 w1] = find(k1 < 220);
for p = 1:length(q1)
    k5(q1(p),w1(p)) = 1;
end

se = strel('disk',5);
k6 = imerode(k5,se);
Cntr = [];
boundaries = bwboundaries(k6);
[m n]=size(k6);
for i=1:length(boundaries)
    temp=boundaries{i};
    x=temp(:,1);
    y=temp(:,2);
    posX = length(find(x == 1));
    posY = length(find(y == n));
    if posX ~= 0 && posY ~= 0
        Cntr = temp;
    end

end   
end

            

