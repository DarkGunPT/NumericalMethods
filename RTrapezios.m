%RTrapezios Regra dos Trapezios para aproximacao de integracao 
%   T=RTrapezios(f,a,b,n)
%   a(n) = a(1)+(n-1)*r  
%
%INPUT:
%   f - funçao integrante
%   a - valor inferior do intervalo de integracao
%   n - numero de iteraçoes 
%   b - valor superior do intervalo de integracao
%OUTPUT: 
%   T - valor aproximado da integracao obtido com o metodo dos trapezios
%   T = h/2 *(f(x0) + 2*f(x1) + 2*f(x2) + ... + f(x))
%   
%   André Lopes - 2019139754
%   Nuno Honório - 2019126457
%   Rafaela Carvalho - 2019127935
%   Samuel Tavares - 2019126468

function t = RTrapezios(f,a,b,n)
h=(b-a)/n;
t=0;
x=a;
for i=1:n-1
    x=x+h;
    t=t+2*f(x);
end

t = h*(f(a)+f(b)+t)/2;
