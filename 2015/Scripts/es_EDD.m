function [resp]=es_EDD(A)
    [m,n]=size(A);
    
    for i=1:m
        if(abs(A(i,i)))<(sum(abs(A(i,1:n)))-abs(A(i,i))) %//Si el valor sobre la diagonal es menor que la suma de los valores de ese renglon - el pivot, retorno
        disp ('NO ES EDD');
        resp=0;%//0 = No es EDD.
        return;
        end
    end
    disp ('SI ES EDD');
    resp=1;
end