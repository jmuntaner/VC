% Initialises models from images, not really needed as there are the
% pertinent matfiles.
function H = histogramModels(colormodel)
    itmp = imread("model1.jpg");
    h1 = histo(itmp,colormodel);
    itmp = imread("model2.jpg");
    h2 = histo(itmp,colormodel);
    itmp = imread("model3.jpg");
    h3 = histo(itmp,colormodel);
    h1 = imgaussfilt(h1,1);
    h2 = imgaussfilt(h2,1);
    h3 = imgaussfilt(h3,1);
    H=cat(3,h1,h2,h3);
    H=shiftdim(H,2);
end