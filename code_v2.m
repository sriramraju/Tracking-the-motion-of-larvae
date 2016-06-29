clc;
clear all;

% Set up the movie.
writerObj = VideoWriter('temp3.avi'); % Name it.
writerObj.FrameRate = 30; % How many frames per second.
open(writerObj);

vData = VideoReader('High_res.mov');
nFrames = vData.NumberOfFrames;
vidHeight = vData.Height;
vidWidth = vData.Width;
FrameRate = vData.FrameRate;

% Initial Detection
close all;
imshow(read(vData,1));title('Point the Head');hold on;
[yH xH] = ginput(3);
close all;
imshow(read(vData,1));title('Point the Tail');hold on;
[yT xT] = ginput(3);
close all;

Hx = [];
Hy = [];

Tx = [];
Ty = [];
for i=1:nFrames
    im = (read(vData,i));
    temp = im;
    for num = 1:3
        x = xH(num);
        y = yH(num);
        
        x1 = xT(num);
        y1 = yT(num);
        
        Hx(num,i) = x;
        Hy(num,i) = y;
        out_HD = Hd_Detect(im);
        [Hd_x Hd_y] = fndpts_ellip(out_HD,x,y,10,7,1,50);
        temp(Hd_x-5:Hd_x+5,Hd_y-5:Hd_y+5) = 0;
        xH(num) = Hd_x;
        yH(num) = Hd_y;
        %     subplot(1,2,1);imshow(im);
        %     subplot(1,2,2);imshow(out_HD);
        %     pause(0.1);
        
        Tx(num,i) = x1;
        Ty(num,i) = y1;
        out_TL = Tl_Detect(im);
        [Tl_x Tl_y] = fndpts_ellip(out_TL,x1,y1,20,7,0,50);
        temp(Tl_x-5:Tl_x+5,Tl_y-5:Tl_y+5) = 0;
        xT(num) = Tl_x;
        yT(num) = Tl_y;
        
        % Contour
%         b = Cntr_detect(im);
%         imshow(im);hold on;
%         plot(b(:,2),b(:,1),'g','LineWidth',3);
%         hold off;
%         pause(0.1);
% subplot(1,2,1);imshow(im);
% subplot(1,2,2);imshow(out_TL);
        
%         subplot(1,3,1);imshow(im);
%         subplot(1,3,2);imshow(out_HD);
%         subplot(1,3,3);imshow(out_TL);
        
  
    end
    imshow(temp);
%     subplot(1,3,1);imshow(temp);title('Tracking');
%     subplot(1,3,2);imshow(out_HD);title('Head');
%     subplot(1,3,3);imshow(out_TL);title('Tail');
    
    % create movie
    frame = getframe(gcf); % 'gcf' can handle if you zoom in to take a movie.
    writeVideo(writerObj, frame);
    
    pause(0.1);
end
close(writerObj);

% subplot(1,3,1);plot(Tx(1,:));xlabel('Frames');ylabel('X position of Tail');title('Larvae 1');
% subplot(1,3,2);plot(Tx(2,:));xlabel('Frames');ylabel('X position of Tail');title('Larvae 2');
% subplot(1,3,3);plot(Tx(3,:));xlabel('Frames');ylabel('X position of Tail');title('Larvae 3');
% 
% temp1 = sqrt((Hx(1,:)-Hx(1,1)).^2+(Hy(1,:)-Hy(1,1)).^2);
% temp2 = sqrt((Hx(2,:)-Hx(2,1)).^2+(Hy(2,:)-Hy(2,1)).^2);
% temp3 = sqrt((Hx(3,:)-Hx(3,1)).^2+(Hy(3,:)-Hy(3,1)).^2);
% subplot(1,3,1);plot(temp1);xlabel('Frames');ylabel('Position of Head');title('Larvae 1');
% subplot(1,3,2);plot(temp2);xlabel('Frames');ylabel('Position of Head');title('Larvae 2');
% subplot(1,3,3);plot(temp3);xlabel('Frames');ylabel('Position of Head');title('Larvae 3');