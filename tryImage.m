function p = tryImage(originalImage,colormodel)
    p = recursion(originalImage,-1);
    
    function p = recursion(im, prevSum)
        [p, votes, ~] = voteImage(im,colormodel);
        if (p == 1)
            return;
        end
        S = sum(votes, 'all');
        if (S>prevSum)
            [sx, sy , ~] = size(im);
            sx2 = floor(sx/2);
            sy2 = floor(sy/2);
            sx4 = floor(sx/4);
            sy4 = floor(sy/4);
            im1 = im(1:sx2,:,:);
            im2 = im(sx2:sx,:,:);
            im3 = im(:,1:sy2,:);
            im4 = im(:,sy2:sy,:);
            im5 = im(sx4:3*sx4,sy4:3*sy4,:);
            p = recursion(im1, S)|recursion(im2, S)|recursion(im3, S)|recursion(im4, S)|recursion(im5, S);
        else
            p = 0;
        end
    end
end