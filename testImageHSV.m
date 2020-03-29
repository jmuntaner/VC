function [p,votes,results] = testImageHSV(im)
    m = matfile("modelsHSV.mat");
    H = m.H;
    [BChi, BInter] = loadThreshold(70,26); 
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

function [BChi, BInter] = loadThreshold(tChi,tInter) %65 100
    b = matfile("barcelonaHSV.mat").barcelonaHSV;
    barInter = b(:,1,:);
    barChi = b(:,2,:);
    BChi = prctile(barChi, tChi);
    BInter = prctile(barInter, tInter);
end