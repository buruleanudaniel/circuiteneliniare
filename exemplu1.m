function circuit = exemplu1()
    % PENTRU PRIMUL EXEMPLU, O SRT CU DIODA
    % AVEM R = 1.25, e = 1.25 => n = 2, l = 2
    
    circuit.N = 2;
    circuit.L = 2;
    circuit.ni(1) = 2;
    circuit.nf(1) = 1;
    circuit.tip(1) = 'R';    
    if (circuit.tip(1) == 'R')
            circuit.e(1) = 1.25;
            circuit.R(1) = 12.5;
            
    circuit.ni(2) = 1;
    circuit.nf(2) = 2;
    circuit.tip(2) = 'n';
    end
    circuit.tol = 0.01;
    circuit.itmax = 10;
    
end

