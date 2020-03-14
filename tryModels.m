function results = tryModels(h1, h2, h3)
    path = "./soccer_data/soccer/";
    equips = ["acmilan", "barcelona", "chelsea", "juventus", "liverpool", "madrid", "psv"];
    results = zeros(7,40,3);
    for i = 1:7
        for j = 1:40
            num = string(j);
            if(j<10)
                num = strcat("0",num);
            end
            ipath = strcat(path,equips(i),"/",num,".jpg");
            itmp = imread(ipath);
            htmp = im2histo(itmp);
            hfilt = imgaussfilt(htmp,2);
            p1 = histogramsCompare(h1,hfilt);
            p2 = histogramsCompare(h2,hfilt);
            p3 = histogramsCompare(h3,hfilt);
            results(i,j,:)=[p1, p2, p3];
        end
    end
end