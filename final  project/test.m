clc;
close all;
clear all;

    I = imread('blurry car.jpg');
    imshow(I);
    lengthmin =12;
    lengthmax = 15;
    thetamin =331;
    thetamax=335;

    figure;
    for length = lengthmin:0.2:lengthmax
        for theta = thetamin:0.5:thetamax
            PSF = fspecial('motion',length,theta);
            res = deconvlucy(I,PSF,100);
            res2 =deconvreg(I,PSF);
            noise_var = 0;
            signal_var = var(double(I(:)));
            estimated_nsr = noise_var/signal_var;
            res1= deconvwnr(I,PSF,estimated_nsr); 
            %res  = medfilt2(rgb2gray(res));
            f = imfilter(res, fspecial('average', [3 3]));
             imshow(f);
        end
    end