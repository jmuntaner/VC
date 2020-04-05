function R = testFullDatasetRGB
    %dataset de imatges
    global D;
    D = loadDataset;
    %results dataset (raw sense barca -/- update?)
    global barInter;
    global barChi;
    b = matfile("barcelona.mat").barcelona;
    barInter = b(:,1,:);
    barChi = b(:,2,:);
    %models
    global H
    m = matfile("models.mat");
    H = m.H;
    % tests with steps of one between 25 and 76 and stores in consecutive
    % values
    R = zeros(51,51,3);
    for i=1:51
        i
        for j=1:51
            j
            [~,fp,fn]=tryDatasetTRGB(i+24,j+24);
            R(i,j,1)=fp;
            R(i,j,2)=fn;
            R(i,j,3)=fn+fp;
        end
    end
    clear global;
end
%50 55