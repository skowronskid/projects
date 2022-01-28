close all
clear 
clc


% Przykłady opisywane w raporcie:

%% Przykład 1

A = [1 2 3 4; 2 1 2 3 ; 3 2 1 2 ; 4 3 2 1];
B = [1 2; 3 4 ; 5 6 ; 7 8]; 
[L, U] = CroutLU(A); 
x1 = SolveMatrixEquation(A,B,true);     %AX=B 
x11 = linsolve(A,B); 
% sprawdzenie czy wynik jest dobry
all((abs(x1-x11)<1e-8))


%% Przykład 2

A = [3 1 4 1; 5 9 2 6 ; 5 3 5 8 ; 9 7 9 3];
B = [2 3 8 4 ; 6 2 6 4]; 
x1 = SolveMatrixEquation(A,B,false);    %XA=B 
x11 = mrdivide(B,A);
all((abs(x1-x11)<1e-8))

%% Przykład 3

A = [2 7 1; 8 2 8 ; 1 8 2];
B = diag(ones(1,3)); 
x1 = SolveMatrixEquation(A,B,true);    %AX=B 
x11 = linsolve(A,B); 
x2 = SolveMatrixEquation(A,B,false);   %XA=B 
x22 = mrdivide(B,A);
all((abs(x1-x11)<1e-8))   %sprawdzenie czy AX=B ma dobry wynik
all((abs(x2-x22)<1e-8))   %sprawdzenie czy XA=B ma dobry wynik
all((abs(x1-x2)<1e-8))   %sprawdzenie czy poprzednie X są takie same

%% Przykład 4

A = [1 1 ; -1 2];
B = [2 5 ; -5 7];
x1 = SolveMatrixEquation(A,B,true);    %AX=B 
x11 = linsolve(A,B); 
x2 = SolveMatrixEquation(A,B,false);   %XA=B 
x22 = mrdivide(B,A);
all((abs(x1-x11)<1e-8))   %sprawdzenie czy AX=B ma dobry wynik
all((abs(x2-x22)<1e-8))   %sprawdzenie czy XA=B ma dobry wynik
all((abs(x1-x2)<1e-8))   %sprawdzenie czy poprzednie X są takie same

%% Przykład 5

A = [ -62.1057   27.5795    3.0750; -75.2613  -96.7760    8.9044;  64.1993   79.1909   21.2884];
B = [  52.0872;   71.0694;  -23.4263];
x1 = SolveMatrixEquation(A,B,true);    %AX=B 
x11 = linsolve(A,B);
all((abs(x1-x11)<1e-8)) 

%% Przykład 6
A =  [-6	-6	4	-2	-4	-7	-4	0	9	;
        3	5	6	2	-9	1	-1	0	-7	;
        1	1	1	8	-1	8	2	-5	-2	;
        -6	-4	-1	7	-3	-2	8	-8	10	;
        -9	9	3	8	1	4	0	-8	3	;
        6	6	8	9	9	3	-1	8	8	;
        6	8	4	7	-4	0	5	-5	0	;
        -1	-8	1	-9	-3	0	0	8	-9	;
        -8	-6	-4	-9	8	9	8	5	3	];
B = [-8	2	-8	3	-4	1	-3	-4	-6	;
    -9	2	10	6	-4	-7	-5	-3	-6	;
    8	4	-9	6	8	-6	6	-4	3	;
    -5	3	7	-9	-1	5	5	-6	-4	;
    -9	-1	7	-4	7	7	-4	-2	2	;
    7	-7	-9	4	-8	-9	2	4	9	;
    -7	6	1	0	8	6	-1	-5	5	;
    8	-5	9	10	-9	10	-8	4	4	;
    -8	4	-3	5	8	-3	-9	-1	10];
x1 = SolveMatrixEquation(A,B,true);    %AX=B 
x11 = linsolve(A,B); 
x2 = SolveMatrixEquation(A,B,false);   %XA=B 
x22 = mrdivide(B,A);
all((abs(x1-x11)<1e-8))   %sprawdzenie czy AX=B ma dobry wynik
all((abs(x2-x22)<1e-8))   %sprawdzenie czy XA=B ma dobry wynik
all((abs(x1-x2)<1e-8))   %wyniki nie są takie same, ale tak miało być





