function [x] = SolveMatrixEquation(A,B, isAX)
%funcka implementuje rozwiązanie macierzowego równania AX=B, lub XA=B
%przyjmuje macierze A i B,
%a także argument isAX którry decyduje o formie równania
%zwraca szukany x

if nargin < 3 %jesli nie poda się isAX to liczy AX=B
    isAX = True;
end
if ~isAX %jeśli XA=B to liczę dla A'X'=B' (obustronna transpozycja)
    A = A';
    B = B';
end
[L,U] = CroutLU(A);
y = LowerTriangularSolve(L,B);
x = UpperTriangularSolve(U,y);
%transpozycja x przy XA=B
if ~isAX 
    x = x';
end
end