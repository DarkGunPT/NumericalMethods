%NRK2  Método de RK2 para SED 
%
%INPUT
%   f(t,u,v)=y'
%   g(t,u,v)=y''
%    [a, b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   u0 - condição inicial do array u
%   v0 - condição inicial do array v
%OUTPUT:
%     t(i+1) = t(i) + h;
%     k1u = f(t(i),u(i),v(i));
%     k1v = g(t(i),u(i),v(i));
%     k2u=f(t(i)+h/2,u(i)+h/2k1u,v(i)+h/2k1v);
%     k2v=g(t(i)+h/2,u(i)+h/2k1u,v(i)+h/2k1v);
%     u(i+1)=u(i)+hk2u;
%     v(i+1)=v(i)+hk2v;

%   ArménioCorreia .: armenioc@isec.pt

%   Trabalho realizado por:
%   17/05/2020 André Lopes - 2019139754
%   17/05/2020 Nuno Honório - 2019126457
%   17/05/2020 Rafaela Carvalho - 2019127935
%   17/05/2020 Samuel Tavares - 2019126468


function [t,u,v]=N_RK2_SED(f,g,a,b,n,u0,v0)
h=(b-a)/n;    % Divisão regular do intervalo [a,b] pelo número de iterações n
t=a:h:b;     % Criação de um array t [a,b] com passo h
u=zeros(1,n+1);     % Criação de uma array u com n+1 elementos todos com valor 0
v=zeros(1,n+1);   % Criação de uma array v com n+1 elementos todos com valor 0
u(1)=u0;     % Atribuição do valor de u0 à primeira posição do array u
v(1)=v0;    % Atribuição do valor de v0 à primeira posição do array v
for i=1:n
    k1u=h*f(t(i),u(i),v(i));
    k1v=h*g(t(i),u(i),v(i));
    k2u=h*f(t(i+1),u(i)+k1u,v(i)+k1v);
    k2v=h*g(t(i+1),u(i)+k1u,v(i)+k1v);
    u(i+1)=u(i)+(1/2)*(k1u+k2u);
    v(i+1)=v(i)+(1/2)*(k1v+k2v);
end
