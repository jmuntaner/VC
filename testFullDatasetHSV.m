function R = testFullDatasetHSV
    %dataset de imatges
    global D;
    D = loadDataset;
    %results dataset (raw sense barca -/- update?)
    global barInter;
    global barChi;
    b = matfile("barcelonaHSV.mat").barcelonaHSV;
    barInter = b(:,1,:);
    barChi = b(:,2,:);
    %models
    global H
    m = matfile("modelsHSV.mat");
    H = m.H;
    R = zeros(51,51,3);
    for i=5:5:100
        i
        for j=5:5:100
            j
            [~,fp,fn]=tryDatasetTHSV(i,j);
            R(i,j,1)=fp;
            R(i,j,2)=fn;
            R(i,j,3)=fn+fp;
        end
    end
    clear global;
end
%50 55