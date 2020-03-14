function [h1, h2, h3] = initModels
    itmp = imread("model1.jpg");
    h1 = im2histo(itmp);
    itmp = imread("model2.jpg");
    h2 = im2histo(itmp);
    itmp = imread("model3.jpg");
    h3 = im2histo(itmp);
    h1 = imgaussfilt(h1,1);
    h2 = imgaussfilt(h2,1);
    h3 = imgaussfilt(h3,1);
end