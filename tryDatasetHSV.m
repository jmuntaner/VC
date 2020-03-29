function [totals, falsePos, falseNeg, results] = tryDatasetHSV()
    path = "./soccer_data/soccer/";
    equips = ["acmilan", "barcelona", "chelsea", "juventus", "liverpool", "madrid", "psv"];
    results = zeros(7,40);
    for i = 1:7
        for j = 1:40
            num = string(j);
            if(j<10)
                num = strcat("0",num);
            end
            ipath = strcat(path,equips(i),"/",num,".jpg");
            itmp = imread(ipath);
            results(i,j) = barcaHSV(itmp);
        end
    end
    totals = sum(results,2);
    falsePos = (sum(totals,1) - totals(2,1))/(2.4);
    falseNeg = (40 - totals(2,1))/0.4;
end