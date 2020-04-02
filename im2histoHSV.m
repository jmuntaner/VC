% takes an image and returns the 2D-HS-histogram
function h = im2histoHSV(im)
    im=rgb2hsv(im);
    h=histcounts2(im(:,:,1),im(:,:,2),50); %eliminem la component value
end