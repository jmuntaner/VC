% takes an image and returns the normalised image
function imN = im2normHSV(im)
    imhsv=rgb2hsv(im);
    h=imhsv(:,:,1);
    s=imhsv(:,:,2);
    v=imhsv(:,:,3);
    ilu=double(h)+double(s)+double(v);
    hN=double(h)./ilu;
    sN=double(s)./ilu;
    vN=double(v)./ilu;
    imN=cat(3,hN,sN,vN);
    imN=im2uint8(imN);
end