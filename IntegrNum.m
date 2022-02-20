% integrNum - Integracao Numerica - regra de Simpson, dos Trapezios e 
%                           a funcao quad (MATLAB)
%
% INPUT:  f - funcao integrante
%         [a, b] - intervalo de derivacao
%         h - passo da discretizacao
% OUTPUT: y - aproximacao da integracao
%
%
%   Trabalho realizado por:
%   1/06/2020 André Lopes - 2019139754
%   1/06/2020 Nuno Honório - 2019126457
%   1/06/2020 Rafaela Carvalho - 2019127935
%   1/06/2020 Samuel Tavares - 2019126468


function y = integrNum(f,a,b,n)

y = zeros(1,3);

y(1) = RSimpson(f,a,b,n);
y(2) = RTrapezios(f,a,b,n);
y(3) = quad(f,a,b);