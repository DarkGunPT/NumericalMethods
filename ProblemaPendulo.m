%PROBLEMAPENDULO  Problema do pêndulo
%
%INPUT:
%   f, g - funções do 2.º membro das Equações Diferenciais
%   [a, b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   u0, v0 - condições iniciais t=a -> u=u0 e v=v0
%CHAMADA DE FUNÇÕES: 
%   NEulerSED
%
%   27/03/2020 - ArménioCorreia .: armenioc@isec.pt

%   ArménioCorreia .: armenioc@isec.pt

%   Trabalho realizado por:
%   19/05/2020 André Lopes - 2019139754
%   19/05/2020 Nuno Honório - 2019126457
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
hold on            %espera por outra funçao
plot(t,v,'+b')
hold off
legend('Deslocamento','Velocidade')
grid on     % coloca uma grelha


