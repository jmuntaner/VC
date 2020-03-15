function R = resultsVoting(data,Ths, b)
    R = zeros(7,40);
    N = size(Ths,2);
    for i = 1:7
        for j = 1:40
            for k = 1:N
                if(b==1)
                    if(data(i,j,1,k)>=Ths(k))
                        R(i,j)=R(i,j)+1;
                    end               
                elseif(b==2)
                    if(data(i,j,2,k)<=Ths(k))
                        R(i,j)=R(i,j)+1;
                    end
                end
            end            
        end
     end
end