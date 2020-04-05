% Initialises models from images, not really needed as there are the
% pertinent matfiles.
function H = initModelsHSV
    itmp = imread("model1.jpg");
    h1 = im2histoHSV(itmp);
    itmp = imread("model2.jpg");
    h2 = im2histoHSV(itmp);
    itmp = imread("model3.jpg");
    h3 = im2histoHSV(itmp);
    h1 = imgaussfilt(h1,1);
    h2 = imgaussfilt(h2,1);
    h3 = imgaussfilt(h3,1);
    H=cat(3,h1,h2,h3);
    H=shiftdim(H,2);
end