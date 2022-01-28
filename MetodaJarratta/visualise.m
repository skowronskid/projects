function [] = visualise(coeffs)
%funkcja służy do wyświetlania wizualizacji ilości kroków potrzebnych
%funkcji Jarratt do dojścia do pierwiastku, oraz ilość kroków
%przyjmuje coeffs - czyli współczynniki wielomianu

n = 1000;   %ilość punktów na osi rzeczywistej
m = 1000;   %ilość punktów na osi urojonej
a = -3;     %początek osi rzeczywistej
b = 3;      %koniec osi rzecywistej    
c = -3;     %początekl osi urojonej
d = 3;      %koniec osi urojonej
[X,Y] = meshgrid(linspace(a,b,n+1),linspace(c,d,m+1)); 
%jest tu +1 bo linspace robi (x2 - x1)/(n-1), a chcemy .../(n)
test = complex(X,Y);
%tworzonie wynikowych macierzy:
A = zeros(n+1,m+1);
B = A;
C = A;

error = 10^(-13); %błąd do funkcji Jarratt

% tu odbywa się całe liczenie
for k = 1:(n+1)
    x_start = test(k,:);
    [A(k,:),B(k,:)] = Jarratt(@Horner,coeffs,x_start,error);
end


%kod związane z ogarnianiem legendy:
%porównanie znalezionych pierwiastków do rzeczywistych pierwiastków
A = round(A,2) + complex(0);
compare = round(roots(flip(coeffs)),2);
A(~ismember(A,compare)) = max(real(A(:))) + 1;  
%dla punktów w których nie znalazło rozwiązania daje największe rozwiązanie
% + 1 żeby było na górze coloarbaru potem
uniA = unique(A);
Asize = size(uniA);
%ogarnięcie ilości pierwiastków, a tym samym ilosci kolorów na wizualizacji
% a także wysokości ticków na colorabarze
numberOfColors = Asize(1);
for k = 1:numberOfColors
    C(A == uniA(k)) = k - 0.5;
end

%napisy na tickach na colorabarze
leb1 = string(uniA);
leb1(end) = "Nie znaleziono";

leb2 = string(5:5:30);
leb2(end + 1) = "Nie znaleziono";


%wizualizacja wyniku
figure
%pokazanie, do którego pierwiastka
ax(1) = subplot(1,2,1);
imagesc([a b], [c,d],C);
set(gca,'YDir','normal');
cmap1 = lines(numberOfColors);
cmap1(end,:) = zeros(3,1);
colormap(ax(1),cmap1);
colorbar("Ticks",unique(C),"TickLabels",leb1);
caxis(gca,[0, numberOfColors]);
title("Zbieżność do pierwiastka");
xlabel("Re");
ylabel("Im");
%pokazanie ilości kroków
ax(2) = subplot(1,2,2);
imagesc([a b], [c,d],B);
set(gca,'YDir','normal');
cmap2 = turbo(35);
cmap2(31:35,:)= zeros(5,3);
colormap(ax(2),cmap2);
caxis(gca,[0 35]);
colorbar("Ticks",[4.5:5:34.5],"TickLabels",leb2);
title("Ilość kroków");
xlabel("Re");
ylabel("Im");


end