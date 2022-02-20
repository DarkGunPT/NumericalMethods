%NEULERSED  M�todo de Euler para SED.
%   [t,u,v] = NEuler_SED(f,g,a,b,n,u0,vo) 
%   u'= f(t,u,v), v'=g(t,u,v), t=[a, b], u(a)=u0 e v(a)=v0  
%
%INPUT:
%   f, g - fun��es do 2.� membro das Equa��es Diferenciais
%   [a, b] - extremos do intervalo da vari�vel independente t
%   n - n�mero de subintervalos ou itera��es do m�todo
%   u0, v0 - condi��es iniciais t=a -> u=u0 e v=v0
%OUTPUT: 
%   [t,u,v] - vector das solu��es aproxima��es e da discretiza��o de t
%   u(i+1) = u(i)+h*f(t(i),u(i),v(i))
%   v(i+1) = v(i)+h*g(t(i),u(i),v(i)) , i =0,1,...,n-1
%
%   27/03/2020 - Arm�nioCorreia .: armenioc@isec.pt

%   Trabalho realizado por:
%   20/05/2020 Andr� Lopes - 2019139754
%   20/05/2020 Nuno Hon�rio - 2019126457
%   20/05/2020 Rafaela Carvalho - 2019127935
%   20/05/2020 Samuel Tavares - 2019126468

 
function [t,u,v]=NEuler_SED(f,g,a,b,n,u0,v0)
h=(b-a)/n;
t=a:h:b;
u=zeros(1,n+1);
v=zeros(1,n+1);
u(1)=u0;
v(1)=v0;
for i=1:n
    u(i+1)=u(i)+h*f(t(i),u(i),v(i));
    v(i+1)=v(i)+h*g(t(i),u(i),v(i));
end