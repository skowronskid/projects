function [L, U] = CroutLU(A)
%funkcja implementuje rozkład LU metodą Crouta
% przyjmuje macierz A
% zwraca macierze L, U 
[nrow, ncol] = size(A);
%w L pierwsza kolumna jest jak w A
L(:, 1) = A(:, 1);
%w U na diagonali są 1, a pierszy wiersz jest łatwy do policzenia
U = diag(ones(1,nrow));
U(1,2:end) = A(1,2:end)./L(1,1);
%w pętli liczę najpierw i-ty wiersz w L, a z tego i-ty wiersz w U 
for i = 2:nrow
    for j = 2:i
        L(i, j) = A(i, j) - L(i, 1:j - 1) * U(1:j - 1, j);
    end
    for j = i + 1:nrow
        U(i, j) = (A(i, j) - L(i, 1:i - 1) * U(1:i - 1, j)) / L(i, i);
    end
end
end