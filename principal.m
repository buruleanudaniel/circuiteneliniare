%ANALIZA CIRCUITELOR REZISTIVE NELINIARE

clc
R = 0; E = 0; Is = 0; Vt = 0;
[R, E, Is, Vt] = citire_simplu(R, E, Is, Vt);

%FARA COMENTARIU -> APLICATIE GENERALA PENTRU ORICE CIRCUIT
%circuit = citire_circuit();

% PENTRU PRIMUL EXEMPLU, O SRT CU DIODA
% AVEM R = 1.25, e = 1.25 => N = 2, L = 2

circuit = exemplu1();

%citire variabile pentru primul circuit prin instructiunea anterioara
%erori: posibil loop infinit, calcul gresit al erorilor

V = zeros(1, circuit.N);
err = 1;
itk = 0;
tol = circuit.tol;
itmax = circuit.itmax;

while true
    
    itk = itk + 1;
    
    for k = 1:circuit.L
        
        if(circuit.tip(k) == "n")
            tens = V(circuit.ni(k)) - V(circuit.nf(k));
            cond_din = gder(tens);
            crt = g(tens);
            circuit.R(k) = 1/cond_din;
            circuit.e(k) = circuit.R(k) * crt - tens;
        end
       
    end
    
    Vn = nodal_crl(circuit);
    scadere = Vn - V;
    err = norm(scadere);
    V = Vn;
    
    if ((err < tol) & (itk > itmax))
        break;
    end
end

% AFISARE VALORI FINALE PENTRU LATURILE RESPECTIVE SE FACE PRIN ANALIZA
% VARIABILELOR DIN WORKSPACE -> crt = curent, V = tensiune analog tens

disp('Curentul prin circuitul analizat este [mA]: ');
disp(crt*1e3);
disp('Tensiunea prin latura analizata este [V]: ');
disp(V(1));
x = crt;
y = V(1);
%plot(x, y);
%xlabel('Curentul prin circuit');
%ylabel('Tensiunea prin elementul neliniar');

%ANALIZA CELUI DE-AL DOILEA CAZ




