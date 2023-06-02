clc
close all
clear all


i = imread('blurry car.jpg');
H =i;
m=size(H,1);
n=size(H,2);
A=fftshift(fft2(H));
L=log(abs(A));Q=sum(L);
mid=floor(n/2);
ru=0;
for i=mid-2:-1:3
    if Q(i+1)>Q(i)&&Q(i+2)>Q(i)&&Q(i-1)>Q(i)&&Q(i-2)>Q(i)
        ru=i; 
        break; 
    end
end
rd=0;
        for i=mid+2:n-2 
            if Q(i+1)>Q(i)&&Q(i+2)>Q(i)&&Q(i-1)>Q(i)&&Q(i-2)>Q(i)
                rd=i;
                break; 
            end
        end
        len=round(2*n/abs(rd-ru));
                psf = fspecial('motion',len,4);
                INITPSF = ones(size(psf));
                [mang,psf] = deconvblind(i,INITPSF,40);
                figure,imshow(mang);
