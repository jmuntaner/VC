function R = testFullDataset(colormodel)
    %dataset de imatges
    D = loadDataset;
    switch(colormodel)
        case{'rgb',0}
            m = matfile("models.mat");
            b = matfile("barcelona.mat").barcelona;
        case{'hsv',1}
            m = matfile("modelsHSV.mat");
            b = matfile("barcelonaHSV.mat").barcelonaHSV;
    end    
    %results dataset (raw sense barca -/- update?)
    barInter = b(:,1,:);
    barChi = b(:,2,:);
    %models
    H = m.H;
    % tests with steps of one between 25 and 76 and stores in consecutive
    % values
    R = zeros(51,51,3);
    results = zeros(7,40);
    for i=1:51
        i
        for j=1:51
            j
            BChi = prctile(barChi, i+24);
            BInter = prctile(barInter, j+24);
            [~,fp,fn]=tryDatasetT;
            R(i,j,1)=fp;
            R(i,j,2)=fn;
            R(i,j,3)=fn+fp;
        end
    end
    function [totals, falsePos, falseNeg] = tryDatasetT
        for ii = 1:7
            for jj = 1:40
                results(ii,jj) = auxTryImage(D{ii,jj});
            end
        end
        totals = sum(results,2);
        falsePos = (sum(totals,1) - totals(2,1))/(2.4);
        falseNeg = (40 - totals(2,1))/0.4;
    end
    function p = auxTryImage(originalImage)
        p = recursion(originalImage,-1);
        function p = recursion(im, prevSum)
            [p, votes, ~] = auxvoteImage(im);
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
                p = recursion(im1, S)|recursion(im2, S)|recursion(im3, S)|recursion(im4, S)|recursion(im5, S);
            else
                p = 0;
            end
        end
    end
    function [p,votes,results] = auxvoteImage(im)   
        N = size(H,1);
        results = zeros(2,N);
        votes = zeros(2,N);
        h = imgaussfilt(histo(im,colormodel),1);
        for k = 1:N
            hmodel = squeeze(H(k,:,:));
            %chisquare
            results(2,k) = histogramsCompare(hmodel,h,1);
            votes(2,k) = results(2,k)<= BChi(1,k);
            %intersec        
            results(1,k) = histogramsCompare(hmodel,h,0);
            votes(1,k) = results(1,k)>= BInter(1,k);
        end
        M = max(votes(1,:),votes(2,:));
        p = sum(M,'all')>2;
    end
end