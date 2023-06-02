clear
close all

img = imread ('blurry car.jpg');
img2 = zeros(size(img));
m = fspecial('motion',7,0);
img2(1,1:7) = m;
mf = fft2(img2);
bmi = abs(ifft2(fft2(img)./mf));
figure,imshow(mat2gray(bmi));
title('motion deblurring by direct dividing');
d = 0.02;
mf = fft2(img2);
mf(find(abs(mf)<d))=1;
bmi = abs(ifft2(fft2(img)./mf));
figure,imshow(mat2gray(bmi)*2);
title('motion deblurring by constrained dividing');