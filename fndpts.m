function [Hd_x Hd_y] = fndpts(k8,x,y,R,val)


cont = 0;
while cont == 0
% R = 10;
[x1 y1] = find(k8 == 0);
a = [];
b = [];
for i=1:length(x1)
    q = x1(i); w = y1(i);
    if (x-q)^2+(y-w)^2 <= R
        a = [a ; q];
        b = [b ; w];
    end
end

if val == 1
    pos = find(a == max(a));
else
    pos = find(a == min(a));
end
length(pos)
if length(pos) == 0
    cont = 0;
    R = R + 10;
else
    Hd_x = a(pos(1));
    Hd_y = b(pos(1));
    cont = 1;
end
end

end