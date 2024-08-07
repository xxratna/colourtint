% % COLOUR TINT ON MATLAB
% By Ratna Aditya Apsari

%% Load the image
clear; close all;

im = imread('timhenson.jpg');
imshow(im)

%% Adjust image intensity and gamma
imbright = imadjust(im,[], [0.1 0.8], [1.45]);
imshow(imbright)

%% Separate image into its respective RGB layers
imdbl = double(imbright); % // Read in your image here
inputRed = imdbl(:,:,1); %// Extract each colour plane
inputGreen = imdbl(:,:,2);
inputBlue = imdbl(:,:,3);

%% Modify each RGB layer
outputRed = inputRed + (inputRed*11/100)+ (inputBlue * 12/100) ;
outputGreen = inputGreen + (inputGreen*14/100) + (inputBlue*23/100);
outputBlue = inputBlue + (inputBlue*10/100)+(inputGreen*7/100) + (inputRed * 29/100);
outmain = uint8(cat(3, outputRed, outputGreen, outputBlue));
imshow(outmain)

%% Modify HSV attributes
HSV = rgb2hsv(outmain);  %# Convert the image to HSV space
HSV(:,:,1) = HSV(:,:,1)*0.99;   % hue
HSV(:,:,2) = HSV(:,:,2)*1.65;   % saturation
HSV(:,:,3) = HSV(:,:,3)*1.15;   % value
imrgb = hsv2rgb(HSV);  %# Convert the image back to RGB space
imshow(imrgb)

%% Sharpen image
imsharp = imsharpen(imrgb,'Radius',0.4,'Amount',0.5);
imshow(imsharp)

%% Show image before and after
figure; 
subplot(121); imshow(im); title('Original');
subplot(122); imshow(imsharp); title('Colour tinted');

%% Write final image as jpg file
imwrite(imsharp,'timhenson_colourtint.jpg');
