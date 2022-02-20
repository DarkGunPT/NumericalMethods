% DI_DFDerivada2 Derivação Numérica - fórmula das diferenças finitas em 3 pontos para a 2º derivada
% Formúla das Diferenças finitas em 3 pontos para a 2º derivada
% f''(xi)=(f(x(i+1)) - 2*f(x(i)) - f(x(i-1))/(h^2)
% INPUT:  f - função
%         [a, b] - intervalo de derivação
%         h - passo da discretização
%         y - imagens x vs y
% OUTPUT: [x, y] - malha de pontos
%         dydx - derivada de f de 2ªordem
%
%   Trabalho realizado por:
%   1/06/2020 André Lopes - 2019139754
%   1/06/2020 Nuno Honório - 2019126457
%   1/06/2020 Rafaela Carvalho - 2019127935
%   1/06/2020 Samuel Tavares - 2019126468

function [x,y,dydx]=DFDerivada_2(f,a,b,h,y)
x=a:h:b;
n=length(x);
if nargin==4
    y=f(x);
end
dydx=zeros(1,n);
dydx(1)=(y(3)-2*y(2)+y(1))/(h^2);
for i=2:n-1
    dydx(i)=(y(i+1)-2*y(i)+y(i-1))/(h^2);
end
dydx(n)=(y(n)-2*y(n-1)+y(n-2))/(h^2);