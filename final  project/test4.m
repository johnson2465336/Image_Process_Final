clear
close all

b=imread('buffalo.png');
%b=rgb2gray(b)
bf=fftshift(fft2(b));
[r,c]=size(b);
[x,y]=meshgrid(-c/2:c/2-1,-r/2:r/2-1);
bworth=1./(1+(sqrt(2)-1)*((x.^2+y.^2)/15^2).^2);
figure,imshow(mat2gray(bworth));
bw=bf.*bworth;
bwa=abs(ifft2(bw));
blur=im2uint8(bwa);
figure,imshow(blur);

blf=fftshift(fft2(blur));
D=40;
bworth2=1./(1+(sqrt(2)-1)*(x.^2+y.^2)/D^2.^10);
figure,imshow(mat2gray(bworth2));
blfb=blf./bworth.*bworth2;
ba=abs(ifft2(blfb/256));
figure,imshow(ba);
