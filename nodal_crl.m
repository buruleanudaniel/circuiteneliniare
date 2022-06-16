function v = nodal_crl(circuit)
    er = 1e-3;
    nrit = 10;
    n = circuit.N;
    L = circuit.L;
    
    for i = 1:n
        iS(i) = 0;
        for j = 1:n
            G(i, j) = 0;
        end
    end
    
    for k = 1:L
        n1 = circuit.ni(k);
        n2 = circuit.nf(k);
        G(n1, n1) = G(n1, n1) + (1/circuit.R(k));
        G(n2, n2) = G(n2, n2) + (1/circuit.R(k));
        G(n1, n2) = G(n1, n2) - (1/circuit.R(k));
        G(n2, n1) = G(n2, n1) - (1/circuit.R(k));
        iS(n1) = iS(n1) - circuit.e(k)/circuit.R(k);
        iS(n2) = iS(n2) + circuit.e(k)/circuit.R(k);
    end
    
    
    v = gauss_seidel(n-1, G, iS, er, nrit);
    v(n) = 0;
    %disp('tensiunea pe nodul respectiv', v);
    pg = 0;
    pc = 0;
    
%     for k = 1:circuit.L
%         u(k) = v(circuit.ni(k)) - v(circuit.nf(k));
%         i(k) = (u(k) + circuit.e(k))/circuit.R(k);
%         pg = pg+circuit.e(k)*i(k);
%         pc = pc+circuit.R(k)*(i(k)^2);
%     end
    
end

function [x] = gauss_seidel(n, a, b, er, nrit)
    for i = 1:n
        x0(i, 1) = 0;
    end
    
    k = 0;
    for i = 1:n
        x(i) = x0(i);
    end
    
    err = 1;
    while(err > er) && (k < nrit)
        err = 0;
        for i = 1:n
            s = b(i);
        end
        for j = 1:n
            s = s-a(i, j) * x(j);
        end
        s = (s+a(i, i)*x(i))/a(i, i);
        err = err+(s-x(i))^2;
        x(i) = s;
    end
    k = k + 1;
    err = sqrt(err);
end


