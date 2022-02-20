%   Trabalho realizado por:
%   11/05/2020 André Lopes - 2019139754
%   11/05/2020 Nuno Honório - 2019126457
%   11/05/2020 Rafaela Carvalho - 2019127935
%   11/05/2020 Samuel Tavares - 2019126468

function varargout = MN_SED_GUI(varargin)
% MN_SED_GUI MATLAB code for MN_SED_GUI.fig
%      MN_SED_GUI, by itself, creates a new MN_SED_GUI or raises the existing
%      singleton*.
%
%      H = MN_SED_GUI returns the handle to a new MN_SED_GUI or the handle to
%      the existing singleton*.
%
%      MN_SED_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MN_SED_GUI.M with the given input arguments.
%
%      MN_SED_GUI('Property','Value',...) creates a new MN_SED_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MN_SED_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MN_SED_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MN_SED_GUI

% Last Modified by GUIDE v2.5 06-Jun-2020 17:04:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MN_SED_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MN_SED_GUI_OutputFcn, ...
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


% --- Executes just before MN_SED_GUI is made visible.
function MN_SED_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MN_SED_GUI (see VARARGIN)

% Choose default command line output for MN_SED_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MN_SED_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

Atualiza(handles);
Atualiza(handles);

% --- Outputs from this function are returned to the command line.
function varargout = MN_SED_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  celfl array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in funcao.
function funcao_Callback(hObject, eventdata, handles)
% hObject    handle to funcao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns funcao contents as cell array
%        contents{get(hObject,'Value')} returns selected item from funcao
posicao = get(handles.funcao,'Value');

switch posicao

    case 1
        set(handles.eF,'String','v');
        set(handles.eG,'String','-sin(u)-0.3*v');
        set(handles.eU,'String','pi/2');
        set(handles.eV,'String','0');
    case 2
        set(handles.eF,'String','v');
        set(handles.eG,'String','-16*u');
        set(handles.eU,'String','9');
        set(handles.eV,'String','0');
    case 3
        set(handles.eF,'String','v');
        set(handles.eG,'String','-10*v-25*u');
        set(handles.eU,'String','0');
        set(handles.eV,'String','-4');
    case 4
        set(handles.eF,'String','v');
        set(handles.eG,'String','-(4/3)*v-(16/3)*u');
        set(handles.eU,'String','1');
        set(handles.eV,'String','0');
       
end 
Atualiza(handles);
Atualiza(handles);

% --- Executes during object creation, after setting all properties.
function funcao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Atualiza(handles)
strF = get(handles.eF,'String');
f = @(t,u,v) eval(vectorize(strF));
strG = get(handles.eG,'String');
g = @(t,u,v) eval(vectorize(strG));
a = str2num(get(handles.eA,'String'));
b = str2num(get(handles.eB,'String'));
n = str2num(get(handles.eN,'String'));
f0 = str2num(get(handles.eU,'String'));
g0 = str2num(get(handles.eV,'String'));

strH = get (handles.funcao,'String');
posicao = get(handles.funcao,'Value');

escolhabg=get(handles.Metodos,'SelectedObject');

escolha=find([handles.rbEuler,...
              handles.rbEulerM,...
              handles.rbRK2,...
              handles.rbRK4,...
              handles.rbTodos]==escolhabg);

EULER = 1;
EULERMELH = 2;
RK2 = 3;
RK4 = 4;
Todos = 5;

testeFunc=MException('MATLAB:MyAtualizar:badFunc',....
                     'Introduza uma função em t,u e v');
testeNReal=MException('MATLAB:MyAtualizar:badNReal',....
                     'Introduza um número real');
testeNb=MException('MATLAB:MyAtualizar:badNReal',....
                     'Introduza um número real e maior que a');   
testeNn=MException('MATLAB:MyAtualizar:badFunc',....
                     'Introduza um número inteiro');  

try
                     
 try
        fTeste=g(sym('t'),sym('u'),sym('v'));
        set(handles.eG,'BackgroundColor','w');
    catch
        set(handles.eG,'BackgroundColor','r');
        throw(testeFunc);
 end
    
 if ~(isscalar(a)&& isreal(a))
         set(handles.eA,'BackgroundColor','r');
         throw(testeNReal);
    else
         set(handles.eA,'BackgroundColor','w');
 end
 
 if ~(isscalar(b)&& isreal(b) && (b>a))
         set(handles.eB,'BackgroundColor','r');
         throw(testeNb);
    else
         set(handles.eB,'BackgroundColor','w');
 end

  if~(isscalar(n) && isreal(n) && n>0)
       set(handles.eN,'BackgroundColor','r');
       throw(testeNn);
   else
       set(handles.eN,'BackgroundColor','w');
  end




        
            
    
    if n < 1
    errordlg('O valor de n tem de ser superior a 1!','ATENÇAO!')
    else
    [t,Euler,v1] = NEuler_SED(f,g,a,b,n,f0,g0); % Chamar o metodo de Euler
    [~,EulerM,v2] = N_EulerMelhorado_SED(f,g,a,b,n,f0,g0); % Chamar o metodo de Euler Melhorado
    [~,RK2,v3] = N_RK2_SED(f,g,a,b,n,f0,g0); % Chamar o metodo Runge-Kutta 2
    [~,RK4,v4] = N_RK4_SED(f,g,a,b,n,f0,g0); % Chamar o metodo Runge-Kutta 4
    
   % t = a: (b-a)/n : b;  % t entre a : h : b, com h=(b-a)/n  - declarar o t

    end 
   
switch escolha
    case EULER
        axes(handles.axes1);
        plot(t,Euler,'-*m');
        legend('Euler');
        tabela=[t.',Euler.'];
        set(handles.Tabela,'Data',num2cell(tabela));
        set(handles.Tabela,'ColumnName',{'t','Euler'});
    case EULERMELH
        axes(handles.axes1);
        plot(t,EulerM,'-sg');
        legend('EulerMelhorado');
        tabela=[t.',EulerM.'];
        set(handles.Tabela,'Data',num2cell(tabela));
        set(handles.Tabela,'ColumnName',{'t','EulerMelhorado'});
    case 3
        axes(handles.axes1);
        plot(t,RK2,'-+k');
        legend('RK2');
        tabela=[t.',RK2.'];
        set(handles.Tabela,'Data',num2cell(tabela));
        set(handles.Tabela,'ColumnName',{'t','RK2'});
    case 4
        axes(handles.axes1);
        plot(t,RK4,'-ob');
        legend('RK4');
        tabela=[t.',RK4.'];
        set(handles.Tabela,'Data',num2cell(tabela));
        set(handles.Tabela,'ColumnName',{'t','RK4'});
    case Todos
        axes(handles.axes1);
        plot(t,Euler,'-*m');
        hold on;
        plot(t,EulerM,'-sg');
        plot(t,RK2,'-+k');
        plot(t,RK4,'-ob');
        legend('Euler','EulerM','RK2','RK4');      
        tabela=[t.',Euler.',EulerM.',RK2.',RK4.'];      
        set(handles.Tabela,'Data',num2cell(tabela));
        set(handles.Tabela,'ColumnName',{'t','Euler','EulerMelhorado','RK2',...
                                           'RK4'});
end
hold off;
grid on;

catch Me
    errordlg(Me.message,'ERRO','modal')
end



function eF_Callback(hObject, eventdata, handles)
% hObject    handle to eF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eF as text
%        str2double(get(hObject,'String')) returns contents of eF as a double


% --- Executes during object creation, after setting all properties.




function eG_Callback(hObject, eventdata, handles)
% hObject    handle to eG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eG as text
%        str2double(get(hObject,'String')) returns contents of eG as a double


% --- Executes during object creation, after setting all properties.




function eA_Callback(hObject, eventdata, handles)
% hObject    handle to eA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eA as text
%        str2double(get(hObject,'String')) returns contents of eA as a double


% --- Executes during object creation, after setting all properties.




function eB_Callback(hObject, eventdata, handles)
% hObject    handle to eB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eB as text
%        str2double(get(hObject,'String')) returns contents of eB as a double


% --- Executes during object creation, after setting all properties.




function eN_Callback(hObject, eventdata, handles)
% hObject    handle to eN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eN as text
%        str2double(get(hObject,'String')) returns contents of eN as a double


% --- Executes during object creation, after setting all properties.




function eU_Callback(hObject, eventdata, handles)
% hObject    handle to eU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eU as text
%        str2double(get(hObject,'String')) returns contents of eU as a double


% --- Executes during object creation, after setting all properties.




function eV_Callback(hObject, eventdata, handles)
% hObject    handle to eV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eV as text
%        str2double(get(hObject,'String')) returns contents of eV as a double


% --- Executes during object creation, after setting all properties.


% --- Executes on button press in pbAtualizar.
function pbAtualizar_Callback(hObject, eventdata, handles)
Atualiza(handles);
Atualiza(handles);
% hObject    handle to pbAtualizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pbRESET.
function pbRESET_Callback(hObject, eventdata, handles)
% hObject    handle to pbRESET (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
   set(handles.eA,'String','');
   set(handles.eB,'String','');
   set(handles.eN,'String','');
   set(handles.eU,'String','');
   set(handles.eV,'String','');
   set(handles.eG,'String','');



% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
SN=questdlg('Tem a certeza que deseja sair?','SAIR','Sim','Não','Sim');
if strcmp(SN,'Não')
    return;
else
    closereq();
end
delete(handles.figure1);




% --- Executes on button press in pbSair.
function pbSair_Callback(hObject, eventdata, handles)
% hObject    handle to pbSair (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SN=questdlg('Tem a certeza que deseja sair?','SAIR','Sim','Não','Sim');
if strcmp(SN,'Não')
    return;
else
    closereq();
end
delete(handles.figure1);




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


% --- Executes during object deletion, before destroying properties.
function eB_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to eB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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


% --- Executes during object creation, after setting all properties.
function eV_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(MN_SED_GUI);
MN_PRINCIPAL_GUI


% --------------------------------------------------------------------
function MN_SED_GUI_Callback(hObject, eventdata, handles)
% hObject    handle to MN_SED_GUI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Relatorio_AM2_TP2.pdf')