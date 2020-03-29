function [totals, falsePos, falseNeg, results] = tryDatasetTHSV(chi, inter)
    global D;
    results = zeros(7,40);    
    for i = 1:7
        for j = 1:40
            results(i,j) = testImageTHSV(D{i,j}, chi, inter);
        end
    end
    totals = sum(results,2);
    falsePos = (sum(totals,1) - totals(2,1))/(2.4);
    falseNeg = (40 - totals(2,1))/0.4;
end

function p = barcaT(im, chi, inter)
    p = barcaR(im,-1,chi,inter);
end

function p = barcaR(im, prevSum,chi,inter)
    [p, votes, ~] = testImageTHSV(im,chi,inter);
    if (p == 1)
        return;
    end
    S = sum(votes, 'all');
    if (S>prevSum)
        [sx, sy , ~] = size(im);
        sx2 = floor(sx/2);
        sy2 = floor(sy/2);
        sx4 = floor(sx/4);
        sy4 = floor(sy/4);
        im1 = im(1:sx2,:,:);
        im2 = im(sx2:sx,:,:);
        im3 = im(:,1:sy2,:);
        im4 = im(:,sy2:sy,:);
        im5 = im(sx4:3*sx4,sy4:3*sy4,:);
        p = barcaR(im1, S,chi,inter)|barcaR(im2, S,chi,inter)|barcaR(im3, S,chi,inter)|barcaR(im4, S,chi,inter)|barcaR(im5, S,chi,inter);
    else
        p = 0;
    end
end

function [p,votes,results] = testImageTHSV(im,tChi,tInter)
    global H;
    global barInter;
    global barChi;
    BChi = prctile(barChi, tChi);
    BInter = prctile(barInter, tInter);
    h = imgaussfilt(im2histoHSV(im),1);
    N = size(H,1);
    results = zeros(2,N);
    votes = zeros(2,N);
    for k = 1:N
        hmodel = squeeze(H(k,:,:));
        %chisquare
        results(2,k) = histogramsCompare(hmodel,h,1);
        votes(2,k) = results(2,k)<= BChi(1,k);
        %intersec        
        results(1,k) = histogramsCompare(hmodel,h,0);
        votes(1,k) = results(1,k)>= BInter(1,k);
    end
    M=max(votes(1,:),votes(2,:));
    p = sum(M,'all')>2;
end