function results = tryModels(H)
    path = "./soccer_data/soccer/";
    equips = ["acmilan", "barcelona", "chelsea", "juventus", "liverpool", "madrid", "psv"];
    N = size(H,1);
    results = zeros(7,40,2,N);
    for i = 1:7
        for j = 1:40
            num = string(j);
            if(j<10)
                num = strcat("0",num);
            end
            ipath = strcat(path,equips(i),"/",num,".jpg");
            itmp = imread(ipath);
            htmp = im2histo(itmp);
            hfilt = imgaussfilt(htmp,1);
            for k = 1:N
                hmodel = squeeze(H(k,:,:));
                p1 = histogramsCompare(hmodel,hfilt,1);
                p0 = histogramsCompare(hmodel,hfilt,0);
                results(i,j,2,k)=p1; %chisquare
                results(i,j,1,k)=p0; %intersec
            end
        end
    end
end