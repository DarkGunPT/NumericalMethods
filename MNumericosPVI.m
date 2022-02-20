% m_numericos fun��o para o uso dos tr�s m�todos em simult�neo

%   Arm�nioCorreia .: armenioc@isec.pt

%   Trabalho realizado por:
%   01/04/2020 Andr� Lopes - 2019139754
%   01/04/2020 Nuno Hon�rio - 2019126457
%   01/04/2020 Rafaela Carvalho - 2019127935
%   01/04/2020 Samuel Tavares - 2019126468

function y = MNumericosPVI(f,a,b,n,y0)

MetodoEuler=NEuler(f,a,b,n,y0);
MetodoEulerMelh=NEulerMelh(f,a,b,n,y0);
MetodoRK2=NRK2(f,a,b,n,y0);
MetodoRK4=NRK4(f,a,b,n,y0);

y=table(MetodoEuler,MetodoEulerMelh,MetodoRK2,MetodoRK4);
