%gaussian filter
function h = gaussian(h)
f = fspecial("gaussian",7,2);
h = imfilter(h, f);

