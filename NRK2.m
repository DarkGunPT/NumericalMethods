%N_RK2  M?todo de Runge-Kutta de ordem 2
%   y = N_RK2(f,a,b,n,y0) M?todo num?rico para a resolu??o de um PVI
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condi??o inicial  
%
%INPUT:
%   f - fun??o do 2.? membro da Equa??o Diferencial
%   [a, b] - extremos do intervalo da vari?vel independente t
%   n - n?mero de subintervalos ou itera??es do m?todo
%   y0 - condi??o inicial t=a -> y=y0
%OUTPUT: 
%   y - vetor das aproxima??es discretas da solu??o exata
%   y(i+1) = y(i)+h*f(t(i),y(i)) , i =0,1,...,n-1
%
%   Arm?nioCorreia .: armenioc@isec.pt

%   Trabalho realizado por:
%   17/05/2020 Andr? Lopes - 2019139754
%   17/05/2020 Nuno Hon?rio - 2019126457
%   17/05/2020 Rafaela Carvalho - 2019127935
%   17/05/2020 Samuel Tavares - 2019126468
function y = NRK2(f,a,b,n,y0)
h=(b-a)/n;
t=a:h:b;
y=zeros(1,n+1);
y(1)=y0;
for i=1:n
    k1=h*f(t(i),y(i));
    k2=h*f(t(i+1),y(i)+k1);
    y(i+1)=y(i)+(k1+k2)/2;
end
