function [x,steps] = Jarratt(fun_horner,coefficients,x_start,error)
%implementuje metodę Jarratta do szukania miejsc zerowych wielomianu
%
%przyjume:
%fun_horner - funkcję implementującą algorytm Hornera 
%coefficients - współczynniki wielomianu w kolejności od najmniejszej
%               potęgi do największej
%x_start - wektor liczb zespolonych odpowiadającym punktom startowym 
%error - dopuszczalny błąd wartości w punkcie do 0
%
%zwraca:
%x - wektor pierwiastków do których udało się dojśc każdemu z punktów w
%    x_start
%steps - ilość kroków potrzebną do dojścia do tego pierwiastku

if nargin <4
    error = 10^(-12);
end

value = inf; %potrzebne, żeby wejść w pętle
n = length(x_start);
x = x_start;
steps = Inf(1,n);

step_counter = 0;
while any(abs(value)>error)
    [value, derivative] = fun_horner(coefficients,x);
    % następna linijka jest po to, żeby policzyć to co jest w mianowiniku w
    % metodzie Jarratta
    [value2, derivative2] = fun_horner(coefficients,x - value./(2.*derivative));
    x = x - value./derivative2;
    %disp(x) %do oglądania jak się zmienia 
    steps((abs(value)<error) & (steps > step_counter)) = step_counter;
    step_counter = step_counter + 1;
    %określenie końca działania funkcji
    if step_counter > 30
        steps(steps > step_counter)= step_counter;
        break
    end
end
x;
steps;
end