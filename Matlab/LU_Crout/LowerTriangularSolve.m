function [y] = LowerTriangularSolve(L,B)
%funkcja liczy wynik równania macierzowego Ly=B, gdzie macierz L jest
%macierzą dolną trójkątną
%przyjmuje macierze L i B
%zwraca macierz y
[nrowB,ncolB] = size(B);
y = zeros(nrowB,ncolB);
for i = 1:nrowB
    y(i,:) = (B(i,:) - L(i,1:i)*y(1:i,:))./L(i,i);
end
end