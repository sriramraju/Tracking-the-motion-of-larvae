function out = Hd_Detect(im)

k1 = im(:,:,1);
k2 = im(:,:,2);
k3 = im(:,:,3);



k4 = k1 - k2;
k5 = k1 - k3;
k6 = k2 - k3;


k41 = k4; 
k4 = histeq(k4);
k7 = im2bw(k4,graythresh(k4));

% To extract ROI from BG
[q1 w1] = find(k1 < 220);
for p = 1:length(q1)
    k7(q1(p),w1(p)) = 1;
end

se = strel('disk',3);
out = imdilate(k7,se);



end