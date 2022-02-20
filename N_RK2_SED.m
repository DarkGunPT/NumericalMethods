%NRK2  M�todo de RK2 para SED 
%
%INPUT
%   f(t,u,v)=y'
%   g(t,u,v)=y''
%    [a, b] - extremos do intervalo da vari�vel independente t
%   n - n�mero de subintervalos ou itera��es do m�todo
%   u0 - condi��o inicial do array u
%   v0 - condi��o inicial do array v
%OUTPUT:
%     t(i+1) = t(i) + h;
%     k1u = f(t(i),u(i),v(i));
%     k1v = g(t(i),u(i),v(i));
%     k2u=f(t(i)+h/2,u(i)+h/2k1u,v(i)+h/2k1v);
%     k2v=g(t(i)+h/2,u(i)+h/2k1u,v(i)+h/2k1v);
%     u(i+1)=u(i)+hk2u;
%     v(i+1)=v(i)+hk2v;

%   Arm�nioCorreia .: armenioc@isec.pt

%   Trabalho realizado por:
%   17/05/2020 Andr� Lopes - 2019139754
%   17/05/2020 Nuno Hon�rio - 2019126457
%   17/05/2020 Rafaela Carvalho - 2019127935
%   17/05/2020 Samuel Tavares - 2019126468


function [t,u,v]=N_RK2_SED(f,g,a,b,n,u0,v0)
h=(b-a)/n;    % Divis�o regular do intervalo [a,b] pelo n�mero de itera��es n
t=a:h:b;     % Cria��o de um array t [a,b] com passo h
u=zeros(1,n+1);     % Cria��o de uma array u com n+1 elementos todos com valor 0
v=zeros(1,n+1);   % Cria��o de uma array v com n+1 elementos todos com valor 0
u(1)=u0;     % Atribui��o do valor de u0 � primeira posi��o do array u
v(1)=v0;    % Atribui��o do valor de v0 � primeira posi��o do array v
for i=1:n
    k1u=h*f(t(i),u(i),v(i));
    k1v=h*g(t(i),u(i),v(i));
    k2u=h*f(t(i+1),u(i)+k1u,v(i)+k1v);
    k2v=h*g(t(i+1),u(i)+k1u,v(i)+k1v);
    u(i+1)=u(i)+(1/2)*(k1u+k2u);
    v(i+1)=v(i)+(1/2)*(k1v+k2v);
end
