% Interface de texto para a Deriva��o num�rica
% 08/01/2016  Arm�nio Correia
% 13/04/2016  Arm�nio Correia  armenioc@isec.pt 
%
%   Trabalho realizado por:
%   28/05/2020 Andr� Lopes - 2019139754
%   28/05/2020 Nuno Hon�rio - 2019126457
%   28/05/2020 Rafaela Carvalho - 2019127935
%   28/05/2020 Samuel Tavares - 2019126468

clc;
clear;

fprintf('\n ------------------------------------\n')
fprintf(' -------- DERIVA��O NUM�RICA --------')
fprintf('\n ------------------------------------\n')

while 1
    strF=input('f(x)= ','s');
    f=@(x) eval(vectorize(strF));
    try
        fTeste=f(sym('x'));
        break;
    catch Me
        errordlg('Introduza uma fun��o de x','ERRO','modal');
    end
end

a=str2num(input('a= ','s'));
b=str2num(input('b= ','s'));
h=str2num(input('h= ','s'));

[xd,y,dydxDFP]=DFProgressivas_2(f,a,b,h);

syms x;
df=diff(f(x));
dfdx=@(x) eval(vectorize(char(df)));
x=xd;
dydxExata=dfdx(x);

plot(x,y,'-bs');
hold on;
plot(x,dydxDFP,'-ro','LineWidth',2);
plot(x,dydxExata,'-kd')
legend('f(x)','dydxDFP','dydxExata');
hold off;
shg

erroDFP=abs(dydxExata-dydxDFP);
tabela=[x.',y.',dydxDFP.',dydxExata.',erroDFP.'];
fprintf('\n\t\t x\t\t y\t\t dydx\t dydxExata\t ErroDFP\n');
disp(tabela);

% Escrever os dados no excel
Filename='TabelaDerivada.xlsx';
sheet='Folha1';
xlswrite(Filename,strF,sheet,'B4');
xlswrite(Filename,a,sheet,'B5');
xlswrite(Filename,b,sheet,'D5');
xlswrite(Filename,h,sheet,'F5');
xlswrite(Filename,tabela,sheet,'A8');
winopen(Filename);