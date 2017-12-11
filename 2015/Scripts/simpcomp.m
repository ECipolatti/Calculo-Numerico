function s = simpcomp(a,b,M)
    npts = 2*M + 1;
    x = linspace(a,b,npts);
    h = (b-a) / (2*M);
    s0 = feval(@f,x(1)) + feval(@f,x(npts));
    s1 = 0;
    for i = 1 : M - 1
        s1 = s1 + feval(@f,x(2*i+1));
    end
    s2 = 0;
    for i = 1 : M
        s2 = s2 + feval(@f,x(2*i));
    end
    s = h/3 * (s0 + 2*s1 + 4*s2);
end