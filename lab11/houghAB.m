function H = houghAB(I)

    A = -10:0.1:10;
    B = -10:0.1:10;
    
    H = zeros(length(B),length(A));
    
    [X Y] = size(I);
    
    
    for xx=1:X
        for yy=1:Y            
            if (I(yy,xx) > 0 )                
                for i=1:numel(A)
                    b_v = yy - A(i)*xx;           
                    [v bb] = min (abs (b_v - B) );
                    if b_v>=-10 && b_v<=10
                      H(i,bb) = H(i,bb) + 1;
                    end  
                end
            end
        end
    end    

end
