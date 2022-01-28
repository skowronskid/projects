function [coeffs] = generate_coeffs(deg)
%tworzy wektor współczynników coeffs wielomianu podanego stopnia degree

%zakres randomowych liczb
minim = -10;
maxim = 10;

real_part = (abs(minim) + abs(maxim))*rand( 1, deg + 1 ,'double') - abs(minim);
imaginary_part = (abs(minim) + abs(maxim))*rand( 1, deg + 1,'double') - abs(minim);

%złączenie w liczby zespolone
coeffs = complex(round(real_part,2),round(imaginary_part,2)); 

end