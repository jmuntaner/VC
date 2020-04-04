% Casts votes of an image in relation to certain thresholds (obtained
% from percentils of the dataset to ease its finding).
%
% Parameters:
% colormodel: 'rgb',0 or 'hsv',1
% im: the image we want to evaluate
%
% Returns:
% p: final decision (0,1), it is one if at least for one of the distaces it
% surpasses the thresholds of the three models.
%
% votes: the vote for each model and distance (if the comparison with that
% model and distance surpasses the threshold or not).
%
% results: the raw values of the distances, before any comparison to
% thresholds has been made.
function [p,votes,results] = voteImage(im,colormodel)
    switch(colormodel)
        case{'rgb',0}
            % Histograms of each model
            m = matfile("models.mat");
            % the "raw" values given by this function we use to obtain an
            % adequate threshold from
            b = matfile("barcelona.mat").barcelona;
            % Parameters with the best performance according to our
            % experiments
            tChi = 48;
            tInter = 58;
        case{'hsv',1}
            % Same but with HSV
            m = matfile("modelsHSV.mat");
            b = matfile("barcelonaHSV.mat").barcelonaHSV;
            tChi = 60;
            tInter = 75;
    end    
    H = m.H;
    h = imgaussfilt(histo(im,colormodel),1);
    barInter = b(:,1,:);
    barChi = b(:,2,:);
    BChi = prctile(barChi, tChi);
    BInter = prctile(barInter, tInter);
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