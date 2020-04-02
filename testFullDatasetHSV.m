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
    for i=1:51
        i
        for j=1:51
            [~,fp,fn]=tryDatasetTHSV(i+24,j+24);
            R(i,j,1)=fp;
            R(i,j,2)=fn;
            R(i,j,3)=fn+fp;
        end
    end
    clear global;
end
%50 55