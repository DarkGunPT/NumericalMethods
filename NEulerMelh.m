%N_EULER  Método de Euler para PVI.
%   y = N_Euler(f,a,b,n,y0) Método numérico para a resolução de um PVI
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condição inicial  
%
%INPUT:
%   f - função do 2.º membro da Equação Diferencial
%   [a, b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   y0 - condição inicial t=a -> y=y0
%OUTPUT: 
%   y - vetor das aproximações discretas da solução exata
%   y(i+1) = y(i)+h*f(t(i),y(i)) , i =0,1,...,n-1
%
%   ArménioCorreia .: armenioc@isec.pt

%   Trabalho realizado por:
%   20/05/2020 André Lopes - 2019139754
%   20/05/2020 Nuno Honório - 2019126457
%   20/05/2020 Rafaela Carvalho - 2019127935
%   20/05/2020 Samuel Tavares - 2019126468

function y = NEulerMelh(f,a,b,n,y0)
h=(b-a)/n;
t=a:h:b;
t(1) =a;
y=zeros(1,n+1);
y(1)=y0;
for i=1:n
    %y(i+1)=y(i)+h*f(t(i),y(i));
    y(i+1) = y(i)+h/2*(f(t(i),y(i))+h*f(t(i+1),y(i)));    
    t(i+1) = t(i)+h;
end
end
