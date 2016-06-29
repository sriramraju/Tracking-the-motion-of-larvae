function [Hd_x Hd_y] = fndpts_ellip(k8,x,y,ae,be,val,ExpLmt)

cont = 0;
while cont == 0
% R = 10;
[x1 y1] = find(k8 == 0);
a = [];
b = [];
for i=1:length(x1)
    q = x1(i); w = y1(i);
    if ((x-q)^2)/ae^2 +((y-w)^2)/be^2 <= 1
        a = [a ; q];
        b = [b ; w];           
    end
end


if length(a) == 0
        if ae <= ExpLmt
            ae = ae + 3
            be = be + 0.5
            cont = 0;
        else
            Hd_x = x;
            Hd_y = y;
            cont = 1;
        end
else
    if val == 1
        pos = find(a == max(a));
        Hd_x = a(pos(1));
        Hd_y = b(pos(1));
        cont = 1;     
    else
        Hd_x = round(mean(a));
        Hd_y =  round(mean(b));
        cont = 1;
    end
end


end

end