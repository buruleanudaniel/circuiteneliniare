function [circuit] = citire_circuit()

    circuit.N = input('Introduceti numarul de noduri: ');
    circuit.L = input('Introduceti numarul de laturi: ');

    for k = 1:circuit.L
        circuit.ni(k) = input('Introduceti nodul initial: ');
        circuit.nf(k) = input('Introduceti nodul final: ');
        circuit.tip(k) = input('Introduceti tipul circuitului: ', 's');
        if (circuit.tip(k) == 'R')
            circuit.e(k) = input('Introduceti e: ');
            circuit.R(k) = input('Introduceti R: ');
        end
%         circuit.tol = input('Toleranta: ', 's');
%         circuit.itmax = input('Iteratii maxime: ', 's');
    end
    circuit.tol = input('Toleranta: ', 's');
    circuit.itmax = input('Iteratii maxime: ', 's');

end

