function R = resultsVoting(data,ths1, ths2, ths3, b)
    R = zeros(7,40);
    for i = 1:7
        for j = 1:40
            if(b==1)
                if(data(i,j,1,1)>=ths1)
                    R(i,j)=R(i,j)+1;
                end
                if(data(i,j,1,2)>=ths2)
                    R(i,j)=R(i,j)+1;
                end
                if(data(i,j,1,3)>=ths3)
                    R(i,j)=R(i,j)+1;
                end
            elseif(b==2)
                if(data(i,j,2,1)<=ths1)
                    R(i,j)=R(i,j)+1;
                end
                if(data(i,j,2,2)<=ths2)
                    R(i,j)=R(i,j)+1;
                end
                if(data(i,j,2,3)<=ths3)
                    R(i,j)=R(i,j)+1;
                end
            end            
        end
     end
end