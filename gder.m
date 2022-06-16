function [output] = gder(tens)
    Is = 1e-12;
    Vt = 0.0278;
    output = Is*exp(tens/Vt)/Vt;
end

