%N_ODE45  ODE45 do Matlab.
%   [t,y] = N_ODE45(f,a,b,n,y0) Método numérico para a resolução de um PVI
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condição inicial  
%
%INPUT:
%   in1 - função
%   in2 - valor inferior do intervalo
%   in3 - valor superior do intervalo
%   in4 - número de interações
%   in5 - valor inicial
 
%OUTPUT:
%   t - discretização do domínio
%   y - vector das aproximações discretas da solução exacta
%
%   ArménioCorreia .: armenioc@isec.pt

%   Trabalho realizado por:
%   17/05/2020 André Lopes - 2019139754
%   17/05/2020 Nuno Honório - 2019126457
%   17/05/2020 Rafaela Carvalho - 2019127935
%   17/05/2020 Samuel Tavares - 2019126468

 
function [t,y]=NODE45(f,a,b,n,y0)
h=(b-a)/n;
t=a:h:b;
y=zeros(1,n+1);
sol=ode45(f,t,y0);
[t,y]=deval(sol,t);
end

