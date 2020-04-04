function h = histo(im, colormodel)
    switch(colormodel)
        case{0,'rgb'}
            h = im2histo(im);
        case{1,'hsv'}
            h = im2histoHSV(im);
    end
end