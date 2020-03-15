function P = histogramsCompare(h1,h2,metric)
    switch(metric)
        case {0, 'intersect'}
            P = intersection(h1,h2);
        case {1, 'chisqrt'}
            P = chisqrt(h1,h2);
    end
end

function p = intersection(h1,h2)
    s1 = sum(h1,'all');
    s2 = sum(h2,'all');
    h1n = h1./s1;
    h2n = h2./s2;
    h = min(h1n,h2n);
    p = sum(h,'all');
end

function p = chisqrt(h1,h2)
    s1 = sum(h1,'all');
    s2 = sum(h2,'all');
    h1n = h1./s1;
    h2n = h2./s2;
    N = (h1n-h2n).^2;
    D = (h1n+h2n);
    P = N./D;
    p = sum(P,'all','omitnan')/2;
end