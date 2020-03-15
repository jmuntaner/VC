% takes an image and returns the 2D-RB(normalised)-histogram
function h = im2histo(im)
    imN=im2norm(im);
    h=histcounts2(imN(:,:,1),imN(:,:,3),32);
end