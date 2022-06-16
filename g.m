function [Isf] = g(tens)
    Is = 1e-12;
    Vt = 0.0278;
    Isf = Is*(exp(tens/Vt)-1);
end