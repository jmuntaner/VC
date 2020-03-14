function results = tryModels(h1, h2, h3)
    path = "./soccer_data/soccer/";
    equips = ["acmilan", "barcelona", "chelsea", "juventus", "liverpool", "madrid", "psv"];
    results = zeros(7,40,2,3);
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
            p1 = histogramsCompare(h1,hfilt,1);
            p2 = histogramsCompare(h2,hfilt,1);
            p3 = histogramsCompare(h3,hfilt,1);
            results(i,j,2,:)=[p1, p2, p3];
            p1 = histogramsCompare(h1,hfilt,0);
            p2 = histogramsCompare(h2,hfilt,0);
            p3 = histogramsCompare(h3,hfilt,0);
            results(i,j,1,:)=[p1, p2, p3];
        end
    end
end