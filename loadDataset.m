% Loads (opens the images) the entire soccer_data into variable D
function D = loadDataset
    D = cell(7,40);
    path = "./soccer_data/soccer/";
    equips = ["acmilan", "barcelona", "chelsea", "juventus", "liverpool", "madrid", "psv"];
    for i = 1:7
        for j = 1:40
            num = string(j);
            if(j<10)
                num = strcat("0",num);
            end
            ipath = strcat(path,equips(i),"/",num,".jpg");
            itmp = imread(ipath);
            D{i,j}=itmp;
        end
    end
end