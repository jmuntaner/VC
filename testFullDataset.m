function R = testFullDataset
    R = zeros(10,10,3);
    for i=40:2:60
        i
        for j=40:2:60
            j
            [~,fp,fn]=tryDatasetT(i,j);
            R(i,j,1)=fp;
            R(i,j,2)=fn;
            R(i,j,3)=fn+fp;
        end
    end
end
%50 55