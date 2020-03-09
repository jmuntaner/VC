% takes an image and returns the normalised image
function imN = im2norm(im)
    r=im(:,:,1);
    g=im(:,:,2);
    b=im(:,:,3);
    ilu=double(r)+double(g)+double(b);
    rN=double(r)./ilu;
    gN=double(g)./ilu;
    bN=double(b)./ilu;
    imN=cat(3,rN,gN,bN);
    imN=im2uint8(imN);
end