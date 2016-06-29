function pos = fndPos(b,a,m,n,x,y)    

pos = find(a == median(a));

% bw = poly2mask(b,a,m,n);
% bnd = bwboundaries(bw);
% 
% stp = 0;
% 
% for l=1:length(bnd)
%     temp11 = bnd{l,1};
%     bw1 = poly2mask(temp11(:,2),temp11(:,1),m,n);
%     if bw1(round(x),round(y)) == 1
%         pos = find(a == min(a));
%         return;
%     else
%         pos = [];
%     end
% end



end