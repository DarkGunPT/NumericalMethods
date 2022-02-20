%   RSimpson  Regra de Simpson para aproximacao de integracao 
%   a(n) = a(1)+(n-1)*r  
%
%INPUT:
%   f - funçao integrante
%   a - valor inferior do intervalo de integracao
%   n - numero de iteraçoes 
%   b- valor superior do intervalo de integracao
%OUTPUT: 
%   s - valor aproximado da integracao obtido com o metodo de Simpson
%   s = h/3 *(f(x0) + 4*f(x1) + 2*f(x2) + 4*f(x3) + 2*f(x4) + ... + f(x))
%   
%   André Lopes - 2019139754
%   Nuno Honório - 2019126457
%   Rafaela Carvalho - 2019127935
%   Samuel Tavares - 2019126468

function s = RSimpson(f,a,b,n)

h = (b-a)/n;
s = 0;
x=a;

for i=1:n-1
	x=x+h;
	if mod(i,2)==0
		s = s+2*f(x);
	else
		s = s+4*f(x);
	end
end

s = h*(f(a)+f(b)+s)/3;
