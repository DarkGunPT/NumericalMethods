% DI_DFRegressivas_2 Derivação Numérica - fórmula das diferenças regressivas em 2 pontos
% Formúla das Diferenças regressivas em 2 pontos
% f'(xi)=(f(x(i))-f(x(i-1))/h
% INPUT:  f - função
%         [a, b] - intervalo de derivação
%         h - passo da discretização
%         y - imagens x vs y
% OUTPUT: [x, y] - malha de pontos
%         dydx - derivada de f 
%
%   Trabalho realizado por:
%   1/06/2020 André Lopes - 2019139754
%   1/06/2020 Nuno Honório - 2019126457
%   1/06/2020 Rafaela Carvalho - 2019127935
%   1/06/2020 Samuel Tavares - 2019126468

function [x,y,dydx]=DFRegressivas_2(f,a,b,h,y)
x=a:h:b;
n=length(x);
if nargin==4
    y=f(x);
end
dydx=zeros(1,n);
dydx(1)=(y(2)-y(1))/h;
for i=2:n
    dydx(i)=(y(i)-y(i-1))/h;
end