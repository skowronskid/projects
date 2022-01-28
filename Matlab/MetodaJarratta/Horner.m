function [value,derivative] = Horner(coefficients,variable)
%implementacja algorytmu Hornera do szukania wartości i pochodnej wielomianu w punkcie
%przyjmuje:
%coefficients - współczynniki wielomianu gdzie odpowiedni współczynnik stojący
%               przy x o potędze i znajduje się na i-tym miejscu wektora
%variable - wektor argumentów

n = length(coefficients);

w = coefficients(n);
p = w;

for k = (n-1):-1:2
    w = coefficients(k) + variable.*w;
    p = w + variable.*p;
end

w = coefficients(1) + variable.*w;
value = w;
derivative = p;

end