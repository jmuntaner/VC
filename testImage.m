function [p,votes,results] = testImage(im)
    m = matfile("models.mat");
    H = m.H;
    Ths = matfile("Threshold.mat");
    BChi = Ths.BChi;
    BInter = Ths.BInter;
    h = imgaussfilt(im2histo(im),1);
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