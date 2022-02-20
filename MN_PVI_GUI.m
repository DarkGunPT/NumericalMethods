%   ArménioCorreia .: armenioc@isec.pt

%   Trabalho realizado por:
%   22/05/2020 André Lopes - 2019139754
%   22/05/2020 Nuno Honório - 2019126457
%   22/05/2020 Rafaela Carvalho - 2019127935
%   22/05/2020 Samuel Tavares - 2019126468

%MN_PVI_GUI  Métodos Numéricos para resolução de PVI com GUI
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condição inicial  
%
%INPUT:
%   f - função do 2.º membro da Equação Diferencial
%   [a, b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   y0 - condição inicial t=a -> y=y0
%   Método - {Euler, RK2, RK4}
%OUTPUT: 
%   y - vector das aproximações discretas da solução exacta
%   Tabela das soluções aproximadas, solução exata e erros
%   Gráfico das aproximações e da solução exata
%
%   12/03/2020 - ArménioCorreia .: armenioc@isec.pt

function varargout = MN_PVI_GUI(varargin)
% MN_PVI_GUI M-file for MN_PVI_GUI.fig
%      MN_PVI_GUI, by itself, creates a new MN_PVI_GUI or raises the existing
%      singleton*.
%
%      H = MN_PVI_GUI returns the handle to a new MN_PVI_GUI or the handle to
%      the existing singleton*.
%
%      MN_PVI_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MN_PVI_GUI.M with the given input arguments.
%
%      MN_PVI_GUI('Property','Value',...) creates a new MN_PVI_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MN_PVI_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MN_PVI_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MN_PVI_GUI

% Last Modified by GUIDE v2.5 06-Jun-2020 16:59:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MN_PVI_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MN_PVI_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before MN_PVI_GUI is made visible.
function MN_PVI_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MN_PVI_GUI (see VARARGIN)

% Choose default command line output for MN_PVI_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MN_PVI_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

MyAtualizar(handles);


% --- Outputs from this function are returned to the command line.
function varargout = MN_PVI_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function eF_Callback(hObject, eventdata, handles)
% hObject    handle to eF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eF as text
%        str2double(get(hObject,'String')) returns contents of eF as a double


% --- Executes during object creation, after setting all properties.
function eF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function eA_Callback(hObject, eventdata, handles)
% hObject    handle to eA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eA as text
%        str2double(get(hObject,'String')) returns contents of eA as a double


% --- Executes during object creation, after setting all properties.
function eA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function eB_Callback(hObject, eventdata, handles)
% hObject    handle to eB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eB as text
%        str2double(get(hObject,'String')) returns contents of eB as a double


% --- Executes during object creation, after setting all properties.
function eB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function eN_Callback(hObject, eventdata, handles)
% hObject    handle to eN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eN as text
%        str2double(get(hObject,'String')) returns contents of eN as a double


% --- Executes during object creation, after setting all properties.
function eN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eY0_Callback(hObject, eventdata, handles)
% hObject    handle to eY0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eY0 as text
%        str2double(get(hObject,'String')) returns contents of eY0 as a double


% --- Executes during object creation, after setting all properties.
function eY0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eY0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in bSelect.
function bSelect_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in bSelect 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
MyAtualizar(handles);


% --- Executes on button press in bAtualizar.
function bAtualizar_Callback(hObject, eventdata, handles)
% hObject    handle to bAtualizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MyAtualizar(handles);

function bAutor1_Callback(hObject, eventdata, handles)
close(MN_PVI_GUI);
autor1

 
function bMenu_Callback(hObjetct, eventdata, handles) 
close(MN_PVI_GUI);
MN_PRINCIPAL_GUI
 
function MyAtualizar(handles)
% handles    structure with handles and user data (see GUIDATA)

strF = get(handles.eF,'String');
f    = @(t,y) eval(vectorize(strF));
a    = str2num(get(handles.eA, 'String'));
b    = str2num(get(handles.eB, 'String'));
n    = str2num(get(handles.eN, 'String'));
y0   = str2num(get(handles.eY0,'String'));

escolhabg = get(handles.bSelect,'SelectedObject');
escolha   = find([handles.rEuler ...
                handles.rEulerMelh ...
                handles.rRK2 ...
                handles.rRK4 ...
                handles.rODE23 ...
                handles.rODE45 ...
                handles.rTodos] == escolhabg);
EULER = 1;
EULERMELH = 2;
RK2   = 3;
RK4   = 4;
ODE23 = 5;
ODE45 = 6;
TODOS = 7;

try 
    yEuler = NEuler(f,a,b,n,y0); % chamada do método de Euler
    yRK2   = NRK2(f,a,b,n,y0); % chamada do método RK2
    yRK4   = NRK4(f,a,b,n,y0); % chamada do método RK4
    yEulerMelh=NEulerMelh(f,a,b,n,y0); % chamada do método Euler melhorado
    yODE45 = NODE45(f,a,b,n,y0); % chamada do método ODE45
    yODE23 = NODE23(f,a,b,n,y0); % chamada do método ODE23
    sExata=dsolve(['Dy=', strF],...
                  ['y(',num2str(a),')=',num2str(y0)]);
              
    g=@(t) eval(vectorize(char(sExata)));
    h=(b-a)/n;
    t=a:h:b;
    yExata=g(t);
    yExacta=eval(vectorize(char(sExata)));
    switch(escolha)
        case EULER
            plot(t,yEuler,'b','LineWidth',1.5) % gráfico do método euler
            hold on
            plot(t,yExacta,'y','LineWidth',1.5) % gráfico da função exata
            legend('Euler','Solução Exacta')       
            set(handles.uiTabela,'ColumnName',[{'t'},{'Solução Exacta'},...
                {'Euler'},{'Erro Euler'}])
            
            cTabela = [t.',yExata.', yEuler.',abs(yEuler-yExata).']; % tabela com os valores da função exata, euler e erro.
            set(handles.uiTabela,'Data',num2cell(cTabela))
        case EULERMELH
            plot(t,yEulerMelh,'Color',[.61 .51 .74],'LineWidth',1.5)
            hold on
            plot(t,yExacta,'y','LineWidth',1.5)
            legend('Euler Melhorado','Solução Exacta')       
            set(handles.uiTabela,'ColumnName',[{'t'},{'Solução Exacta'},...
                {'Euler Melhorado'},{'Erro Euler Melhorado'}])
            
            cTabela = [t.',yExata.', yEulerMelh.',abs(yEulerMelh-yExata).'];
            set(handles.uiTabela,'Data',num2cell(cTabela))
        case RK2
            plot(t,yRK2,'r','LineWidth',1.5) % gráfico do método rk2
            hold on
            plot(t,yExacta,'y','LineWidth',1.5) % gráfico da exata
            legend('RK2','Solução Exacta')
            hold off
            set(handles.uiTabela,'ColumnName',[{'t'},{'Solução Exacta'},...
                {'RK2'},{'Erro RK2'}])
            cTabela = [t.',yExacta.', yRK2.',abs(yRK2-yExacta).'];
            set(handles.uiTabela,'Data',num2cell(cTabela))
        case RK4
            plot(t,yRK4,'g','LineWidth',1.5) % gráfico do método rk4
            hold on
            plot(t,yExacta,'y','LineWidth',1.5) % gráfico da exata
            legend('RK4','Solução Exacta')
            hold off
            set(handles.uiTabela,'ColumnName',[{'t'},{'Solução Exacta'},...
                {'RK4'},{'Erro RK4'}])
            
            cTabela = [t.',yExacta.', yRK4.',abs(yRK4-yExacta).'];
            set(handles.uiTabela,'Data',num2cell(cTabela))
        case ODE23
            plot(t,yODE23, 'c', 'LineWidth',1.5) % gráfico do método ode23
            hold on
            plot(t,yExacta,'y','LineWidth',1.5) % gráfico da exata 
            legend('ODE23','Solução Exacta')
            hold off
            set(handles.uiTabela,'ColumnName',[{'t'},{'Solução Exacta'},...
                {'ODE23'},{'Erro ODE23'}])
            
            cTabela = [t.',yExacta.', yODE23.',abs(yODE23-yExacta).'];
            set(handles.uiTabela,'Data',num2cell(cTabela))
        case ODE45
            plot(t,yODE45,'k' ,'LineWidth',1.5) % gráfico do método ode45
            hold on
            plot(t,yExacta,'y','LineWidth',1.5) % gráfico da exata
            legend('ODE45','Solução Exacta')
            hold off
            set(handles.uiTabela,'ColumnName',[{'t'},{'Solução Exacta'},...
                {'ODE45'},{'Erro ODE45'}])
            
            cTabela = [t.',yExacta.', yODE45.',abs(yODE45-yExacta).'];
            set(handles.uiTabela,'Data',num2cell(cTabela))
        case TODOS % gráfico de todos os métodos e exata, a aproximação do ode23 e ode45 à exata é tão grande que ficam quase sobrepostas.
            plot(t,yEuler,'b' ,'LineWidth',1.5)
            hold on
            plot(t,yEulerMelh,'Color',[.61 .51 .74],'LineWidth',1.5)
            plot(t,yRK2, 'r' ,'LineWidth',1.5)
            plot(t,yRK4,'g' ,'LineWidth',1.5)
            plot(t,yODE45,'k' ,'LineWidth',1.5)
            plot(t,yODE23, 'c', 'LineWidth',1.5)
            plot(t,yExacta,'y','LineWidth',1.5)
            legend('Euler','Euler Melhorado','RK2','RK4','ODE45','ODE23','Exata')
            
            hold off
            set(handles.uiTabela,'ColumnName',[{'t'},{'Solução Exacta'},...
                {'Euler'},{'Erro Euler'},{'EulerMelh'},{'Erro Euler Melh'},...
                {'RK2'},{'Erro RK2'},{'RK4'},{'Erro RK4'},{'ODE23'},{'Erro ODE23'},{'ODE45'},{'Erro ODE45'}])
            
            cTabela = [t.',yExacta.', yEuler.',abs(yEuler-yExacta).', yEulerMelh.',abs(yEulerMelh-yExacta).',...
                yRK2.',abs(yRK2-yExacta).', yRK4.',abs(yRK4-yExacta).', yODE23.',abs(yODE23-yExacta).', yODE45.',abs(yODE45-yExacta).']; % caso preciso acrescentar ODE
            set(handles.uiTabela,'Data',num2cell(cTabela))
    end
    grid on 
    xlabel('t')
    ylabel('y')
    hold off 
catch Me
     errordlg(['Ocorreu um Erro: ' Me.message],'Erro','modal');
end


% --- Executes on button press in bAutor2.
function bAutor2_Callback(hObject, eventdata, handles)
% hObject    handle to bAutor2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(MN_PVI_GUI);
autor2


% --- Executes on button press in bAutor3.
function bAutor3_Callback(hObject, eventdata, handles)
% hObject    handle to bAutor3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(MN_PVI_GUI);
autor3


% --- Executes on button press in bAutor4.
function bAutor4_Callback(hObject, eventdata, handles)
% hObject    handle to bAutor4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(MN_PVI_GUI);
autor4


% --- Executes on button press in bRelatorio.
function bRelatorio_Callback(hObject, eventdata, handles)
% hObject    handle to bRelatorio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Relatorio_AM2_TP1.pdf')
