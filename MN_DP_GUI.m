% MAQUINADERIVAPRIMITIVA Máquina para calcular derivadas e primitivas
% analiticamente (solução extata) e numericamente (solução aproximada)
% --- 12/01/2016   Arménio Correia   armenioc@isec.pt

%   Trabalho realizado por:
%   1/06/2020 André Lopes - 2019139754
%   1/06/2020 Nuno Honório - 2019126457
%   1/06/2020 Rafaela Carvalho - 2019127935
%   1/06/2020 Samuel Tavares - 2019126468

function varargout = MN_DP_GUI(varargin)
% MN_DP_GUI M-file for MN_DP_GUI.fig
%      MN_DP_GUI, by itself, creates a new MN_DP_GUI or raises the existing
%      singleton*.
%
%      H = MN_DP_GUI returns the handle to a new MN_DP_GUI or the handle to
%      the existing singleton*.
%
%      MN_DP_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MN_DP_GUI.M with the given input arguments.
%
%      MN_DP_GUI('Property','Value',...) creates a new MN_DP_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MN_DP_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MN_DP_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MN_DP_GUI

% Last Modified by GUIDE v2.5 06-Jun-2020 17:13:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MN_DP_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MN_DP_GUI_OutputFcn, ...
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


% --- Executes just before MN_DP_GUI is made visible.
function MN_DP_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MN_DP_GUI (see VARARGIN)



% Choose default command line output for MN_DP_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Preparar o axesSolução para mostrar o resultado
set(hObject,'Name','Derivadas e Primitivas')
set(handles.axesSExata,'box','on');
set(handles.axesSExata,'xtick',[]);
set(handles.axesSExata,'ytick',[]);
     
% Configuração do Texto e atribuição a UserData
hSolucao = struct('hTexto',text('Parent', handles.axesSExata,...
                                     'interpreter','latex',...
                                     'fontsize',20,...
                                     'units','norm',...
                                     'pos',[.05 .5]));   
hSolucao.filhas(1)=DerivacaoNumerica('Visible','Off');  
hSolucao.strF='sin(x)';
set(hObject,'UserData',hSolucao); 
set(hSolucao.filhas(1),'UserData',handles);
pbAnaliticamente_Callback([],[], handles);

% --- Outputs from this function are returned to the command line.
function varargout = MN_DP_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbAnaliticamente.
function pbAnaliticamente_Callback(hObject, eventdata, handles)
% hObject    handle to pbAnaliticamente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

getStrFuncao(handles)
hSolucao = get(handles.figurePrincipal,'UserData');
y=hSolucao.strF;
funcao=@(x) eval(vectorize(y));
 
Escolha02=get(handles.bgDerivadaPrimitiva,'SelectedObject');
EscolhaDP=find([handles.rbDerivada,handles.rbPrimitiva]==Escolha02);
 
syms x;
try  
    if (~isempty(y))
        switch EscolhaDP
            case 1
                dF=diff(funcao(x));
                set(hSolucao.hTexto,'String',['$' latex(dF) '$']);
            case 2
                pF=int(funcao(x));
                set(hSolucao.hTexto,'String',['$' latex(pF) '+ c' '$']);
        end
    end
% catch Me
%     errordlg(Me.message,'Erro','modal')
end


% --- Executes on button press in pbDNumerica.
function pbDNumerica_Callback(hObject, eventdata, handles)
% hObject    handle to pbDNumerica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



getStrFuncao(handles);
hSolucao=get(handles.figurePrincipal,'UserData');
y=hSolucao.strF;
htFuncao=findobj(hSolucao.filhas(1),'Tag','tFuncao');
set(htFuncao,'String',y);
set(hSolucao.filhas(1),'Visible','on');
closereq(); 



% --- Executes on button press in pbINumerica.
function pbINumerica_Callback(hObject, eventdata, handles)
% hObject    handle to pbINumerica (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq();
IntegracaoNumericaa;


% --- Executes on selection change in popupmenuF.
function popupmenuF_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuF contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuF


% --- Executes during object creation, after setting all properties.
function popupmenuF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eG_Callback(hObject, eventdata, handles)
% hObject    handle to eG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eG as text
%        str2double(get(hObject,'String')) returns contents of eG as a double


% --- Executes during object creation, after setting all properties.
function eG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in bgFuncoes.
function bgFuncoes_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in bgFuncoes 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
getStrFuncao(handles);


% --- Executes when user attempts to close figurePrincipal.
function figurePrincipal_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figurePrincipal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
hSolucao=get(hObject,'UserData');
delete(hSolucao.filhas);
delete(hObject);

% --- Aceder a string/função selecionada ou introduzida.
function getStrFuncao(handles)
% handles    structure with handles and user data (see GUIDATA)
Escolha01=get(handles.bgFuncoes,'SelectedObject');
EscolhaFG=find([handles.rbF,handles.rbG]==Escolha01);
switch EscolhaFG
    case 1
        set(handles.eG,'Enable','off');
        set(handles.popupmenuF,'Enable','on');
        escolhaF=get(handles.popupmenuF,'Value');
        switch escolhaF
            case 1
                y='sin(x)';
            case 2
                y='cos(x)';
            case 3
                y='exp(x)';
            case 4   
                y='x^2';
            case 5
                y='log(x)';
        end
    case 2
        set(handles.eG,'Enable','on');
        set(handles.popupmenuF,'Enable','off');
        y=get(handles.eG,'String');            
end
hSolucao=get(handles.figurePrincipal,'UserData');
hSolucao.strF=y;
set(handles.figurePrincipal,'Userdata',hSolucao);


% --- Executes on button press in rbF.
function rbF_Callback(hObject, eventdata, handles)
% hObject    handle to rbF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbF


% --- Executes on button press in rbG.
function rbG_Callback(hObject, eventdata, handles)
% hObject    handle to rbG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rbG


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SN=questdlg('Tem a certeza que deseja sair?','SAIR','Sim','Não','Sim');
if strcmp(SN,'Não')
    return;
else
    closereq();
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close();  
MN_PRINCIPAL_GUI;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Relatorio_AM2_TP3.pdf')
