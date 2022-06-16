function v = solve_crnl_v2(circuit)
    d = 1;
    k = 0;
    er = 1e-3;
    x0 = circuit.ni;
    xvechi = x0;
    
    while d > er && k < circuit.itmax
        k = k + 1;
        xnou = xvechi-((xvechi^2)/(2*xvechi));
        d = abs(xnou-xvechi);
        xvechi = xnou;
    end
    
end

