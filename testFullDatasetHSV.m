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
    % tests with steps of two between 20 and 100 and stores in consecutive
    % values
    R = zeros(41,41,3);
    for i=1:41
        i
        2*(i+9)
        for j=1:41
            [~,fp,fn]=tryDatasetTHSV(2*(i+9),2*(j+9));
            R(i,j,1)=fp;
            R(i,j,2)=fn;
            R(i,j,3)=fn+fp;
        end
    end
    clear global;
end
%50 55