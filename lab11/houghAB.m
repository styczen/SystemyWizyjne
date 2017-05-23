function H = houghAB(I)

    A = -10:0.1:10;
    B = -10:0.1:10;
    
    H = zeros(length(B),length(A));
    
    [X Y] = size(I);
    
    
    for xx=1:X
        for yy=1:Y            
            if (I(xx,yy) > 0 )                
                for i=1:numel(A)
                    b_v = yy - A(i)*xx;           
                    [v bb] = min (abs (b_v - B) );
                    H(i,bb) = H(i,bb) + 1;                   
                end
            end
        end
    end    

end
