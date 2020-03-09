% takes an image and returns the 2D-RB(normalised)-histogram
function h = im2histo(im)
    r=im(:,:,1);
    g=im(:,:,2);
    b=im(:,:,3);
    ilu=double(r)+double(g)+double(b);
    rN=double(r)./ilu;
    gN=double(g)./ilu;
    bN=double(b)./ilu;
    imN=cat(3,rN,gN,bN);
    imN=im2uint8(imN);
    h=histcounts2(imN(:,:,1),imN(:,:,2),8);
end