function R = testFullDataset
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
    R = zeros(30,30,3);
    for i=1:30
        i
        for j=1:30
            j
            [~,fp,fn]=tryDatasetT(i+34,j+34);
            R(i,j,1)=fp;
            R(i,j,2)=fn;
            R(i,j,3)=fn+fp;
        end
    end
    clear global;
end
%50 55