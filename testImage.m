function [p,votes,results] = testImage(im)
    m = matfile("models.mat");
    H = m.H;
    %65 65 (20.833 fp 10 fn)
    %55 60/65 (15.833 fp 12.5 fn)
    %55 55 (15.417 fp 12.5 fn)
    %53 55 (14.5833 fp 12.5 fn) 
    %50 55 (12.0833 fp 15 fn) minim aparent +27.0833
    %50 50 (13.333 fp 15 fn)
    %48 58 (10 fp 15 fn) minim +25
    %48 59 (10 fp 15 fn)
    %47 67 (7.5 fp 17.5 fn)
    %47 70 (7.5 fp 17.5 fn)
    %47 71 (7.5 fp 17.5 fn)
    [BChi, BInter] = loadThreshold(48,58); 
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

function [BChi, BInter] = loadThreshold(tChi,tInter) %65 100
    b = matfile("barcelona.mat").barcelona;
    barInter = b(:,1,:);
    barChi = b(:,2,:);
    BChi = prctile(barChi, tChi);
    BInter = prctile(barInter, tInter);
end