function H = histogramModels(metrica)
    itmp = imread("model1.jpg");
    h1 = histo(itmp,metrica);
    itmp = imread("model2.jpg");
    h2 = histo(itmp,metrica);
    itmp = imread("model3.jpg");
    h3 = histo(itmp,metrica);
    h1 = imgaussfilt(h1,1);
    h2 = imgaussfilt(h2,1);
    h3 = imgaussfilt(h3,1);
    H=cat(3,h1,h2,h3);
    H=shiftdim(H,2);
end