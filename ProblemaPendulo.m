%PROBLEMAPENDULO  Problema do p�ndulo
%
%INPUT:
%   f, g - fun��es do 2.� membro das Equa��es Diferenciais
%   [a, b] - extremos do intervalo da vari�vel independente t
%   n - n�mero de subintervalos ou itera��es do m�todo
%   u0, v0 - condi��es iniciais t=a -> u=u0 e v=v0
%CHAMADA DE FUN��ES: 
%   NEulerSED
%
%   27/03/2020 - Arm�nioCorreia .: armenioc@isec.pt

%   Arm�nioCorreia .: armenioc@isec.pt

%   Trabalho realizado por:
%   19/05/2020 Andr� Lopes - 2019139754
%   19/05/2020 Nuno Hon�rio - 2019126457
%   19/05/2020 Rafaela Carvalho - 2019127935
%   19/05/2020 Samuel Tavares - 2019126468

function ProblemaPendulo(f,g,a,b,n,u0,v0)

if ~nargin
    strF='v';
    f=@(t,u,v)eval(vectorize(strF));
    strG='-sin(u)-0.3*v';
    g=@(t,u,v)eval(vectorize(strG));
    a=0;
    b=15;
    n=100;
    u0=pi/2;
    v0=0;
end

[t,u,v]=NEuler_SED(f,g,a,b,n,u0,v0);
tabela=[t.',u.',v.'];
disp(tabela)
plot(t,u,'*r')        %astriscos a linha do grafico
hold on            %espera por outra fun�ao
plot(t,v,'+b')
hold off
legend('Deslocamento','Velocidade')
grid on     % coloca uma grelha


