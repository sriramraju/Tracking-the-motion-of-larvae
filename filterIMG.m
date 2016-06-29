function [imLP imHP] = filterIMG(img,R)


[m n] = size(img);
Mimg = zeros(2*m,2*n);
Mimg(m/2+1:3*m/2,n/2+1:3*n/2) =img;
F = fft2(uint8(Mimg));
F = fftshift(F); % Center FFT
c = round([m n]);
temp = F;
temp1 = F;
for i=1:2*m
    for j=1:2*n
        pt = [i j];
        dist = sqrt(sum((pt - c).^2));
            if dist <= R
                temp(i,j) = 0;
            end

            if dist > R
                temp1(i,j) = 0;
            end
    end
end

imLP = fftshift(temp1);
imLP = ifft2(imLP);
imLP = uint8(real(imLP));
imLP = imLP(m/2+1:3*m/2,n/2+1:3*n/2);

imHP = fftshift(temp);
imHP = ifft2(imHP);
imHP = uint8(real(imHP));
imHP = imHP(m/2+1:3*m/2,n/2+1:3*n/2);

end