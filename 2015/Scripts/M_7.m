function A = M_7(n)
    A=zeros(n,n);
    for i=1 :n
        for j=1:n
            if(j==i)
                A(i,j)=2*i;
            else if (j==i+2 || j==i-2)
                    A(i,j)=0.5*i;
                else if (j==i+4 || j==i-4)
                        A(i,j)=0.25*i;
                    end
                end
            end
        end
    end
end