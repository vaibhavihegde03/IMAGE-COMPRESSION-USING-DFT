I=imread('landscape.png' ); % Load image
figure(1);
subplot(1,3,1); 
imshow(I); %plot the original colour image
title('original image');
igray=rgb2gray(I); % Convert image to grayscale
imwrite(igray,'grayscale.png'); % save image to new file
subplot(1,3,2);
imshow(igray); % Plot the grayscale image
title('grayscale image');


At=fft2(igray); % FFT of the grayscale image
F = log(abs(fftshift(At))+1); % put FFT on log-scale
subplot(1,3,3);
imshow(mat2gray(F),[]); % plot the shifted FFT of image
title('FFT');



Bt = sort(abs(At(:))); % Sort by magnitude
% Zero out all small coefficients and inverse transform
keep1 = 0.1; % 10 percent image is kept 
thresh1 = Bt(floor((1-keep1)*length(Bt)));
ind1 = abs(At)>thresh1;  % Find small indices
Atlow1 = At.*ind1;       % Threshold small indices

Alow1=uint8(ifft2(Atlow1));% Compressed image
figure(2);
subplot(3,3,1);
imshow(igray); % Plot the grayscale image
title('grayscale image');
subplot(3,3,2);
imshow(Alow1);
imwrite(Alow1,'compressed#1.png');
title('(10% kept) compressed image');

diff_image1 = 255-(igray - Alow1); % difference image
subplot(3,3,3);
imshow(diff_image1);
imwrite(diff_image1,'diff#1.png');
title('difference image');

% code for different values of compression.

% Zero out all small coefficients and inverse transform
keep2 = 0.01; 
thresh2 = Bt(floor((1-keep2)*length(Bt)));
ind2 = abs(At)>thresh2;  % Find small indices
Atlow2 = At.*ind2;       % Threshold small indices

Alow2=uint8(ifft2(Atlow2));  % Compressed image
subplot(3,3,4);
imshow(igray); % Plot the grayscale image
title('grayscale image');
subplot(3,3,5);
imshow(Alow2);
imwrite(Alow2,'compressed#2.png');
title('(1% kept) compressed image');

diff_image2 =  255-(igray - Alow2); % difference image
subplot(3,3,6);
imshow(diff_image2);
imwrite(diff_image2,'diff#2.png');
title('difference image');



% code for different values of compression.

% Zero out all small coefficients and inverse transform
keep3 = 0.001; 
thresh3 = Bt(floor((1-keep3)*length(Bt)));
ind3 = abs(At)>thresh3;  % Find small indices
Atlow3 = At.*ind3;       % Threshold small indices

Alow3=uint8(ifft2(Atlow3));  % Compressed image
subplot(3,3,7);
imshow(igray); % Plot the grayscale image
title('grayscale image');
subplot(3,3,8);
imshow(Alow3);
imwrite(Alow3,'compressed#3.png');
title('(0.1% kept) compressed image');

diff_image3 = 255-(igray - Alow2); % difference image
subplot(3,3,9);
imshow(diff_image3);
imwrite(diff_image3,'diff#3.png');
title('difference image');
