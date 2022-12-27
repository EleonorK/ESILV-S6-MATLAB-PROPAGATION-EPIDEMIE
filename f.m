function f = f(t,S,I)
    %S = 0.7;I = 0.3;
    B = 1.3;N = 1000; d = 0.02; a = 0.98
    S(1) = -(B/N)*S(1)*I + (d+a)*I(1)
    I(1) = (B/N)*S(1)*I - (d+a)*I(1)
end