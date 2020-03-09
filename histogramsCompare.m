function prob = histogramsCompare(h1,h2)
    s1 = sum(h1,'all');
    s2 = sum(h2,'all');
    h1n = h1./s1;
    h2n = h2./s2;
    h = min(h1n,h2n);
    prob = sum(h,'all');
end