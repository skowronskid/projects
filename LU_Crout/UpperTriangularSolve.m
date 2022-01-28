function x = UpperTriangularSolve(U,B)
%funkcja liczy wynik równania macierzowego Ux=B, gdzie macierz U jest
%macierzą górną trójkątną o 1 na diagonali
%przyjmuje macierze U i B
%zwraca macierz x
[nrowB,ncolB] = size(B);
x = zeros(nrowB,ncolB);
for i = nrowB:(-1):1
    x(i,:) = (B(i,:) - U(i,(i + 1):nrowB)*x((i + 1):nrowB,:))/U(i, i);
end      
end