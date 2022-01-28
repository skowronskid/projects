function [A,X] = gen_test(A)
[r,c] = size(A);
while true
    X = randi(30,r,c) - 15; 
    if abs(A*X - X*A) < 1e-10
        break
    end
end