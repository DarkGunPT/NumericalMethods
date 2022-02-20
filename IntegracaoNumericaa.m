%   Trabalho realizado por:
%   1/06/2020 André Lopes - 2019139754
%   1/06/2020 Nuno Honório - 2019126457
%   1/06/2020 Rafaela Carvalho - 2019127935
%   1/06/2020 Samuel Tavares - 2019126468s


function varargout = IntegracaoNumericaa(varargin)
% INTEGRACAONUMERICAA MATLAB code for IntegracaoNumericaa.fig
%      INTEGRACAONUMERICAA, by itself, creates a new INTEGRACAONUMERICAA or raises the existing
%      singleton*.
%
%      H = INTEGRACAONUMERICAA returns the handle to a new INTEGRACAONUMERICAA or the handle to
%      the existing singleton*.
%
%      INTEGRACAONUMERICAA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTEGRACAONUMERICAA.M with the given input arguments.
%
%      INTEGRACAONUMERICAA('Property','Value',...) creates a new INTEGRACAONUMERICAA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IntegracaoNumericaa_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IntegracaoNumericaa_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IntegracaoNumericaa

% Last Modified by GUIDE v2.5 06-Jun-2020 22:22:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IntegracaoNumericaa_OpeningFcn, ...
                   'gui_OutputFcn',  @IntegracaoNumericaa_OutputFcn, ...
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


% --- Executes just before IntegracaoNumericaa is made visible.
function IntegracaoNumericaa_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IntegracaoNumericaa (see VARARGIN)

% Choose default command line output for IntegracaoNumericaa
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

MyAtualizar(handles);

% UIWAIT makes IntegracaoNumericaa wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IntegracaoNumericaa_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MyAtualizar(handles);



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

function MyAtualizar(handles)
% handles estrutura de dados com as handles para os objetos...


set(handles.eF,'BackgroundColor','w');
set(handles.eA,'BackgroundColor','w');
set(handles.eB,'BackgroundColor','w');
set(handles.eN,'BackgroundColor','w');

a = str2num(get(handles.eA, 'String'));
b = str2num(get(handles.eB, 'String'));
n = str2num(get(handles.eN, 'String'));

syms x;
strF = get(handles.eF, 'String');
f = @(x) eval(vectorize(char(strF)));
intF=double(int(f(x),a,b));

escolhabg = get(handles.bgMetodosInt, 'SelectedObject');
escolha = find([handles.rbT,handles.rbS,handles.rbQ,handles.rbTodos] == escolhabg);

testeFunc = MException('MATLAB:MyAtualizar:BadFunc','Introduza uma funcao de x');
testeNum = MException('MATLAB:MyAtualizar:BadNum','Introduza um numero real');
testeAB = MException('MATLAB:MyAtualizar:BadAB','Introduza a e b, tais que: a < b');
testeN = MException('MATLAB:MyAtualizar:BadH','Introduza n real e > 0');

try    
    try
        testef = f(sym('x'));
    catch
        set(handles.eF,'BackgroundColor','r');
        throw(testeFunc);
    end
    if ~(isscalar(a) && isreal(a))
        set(handles.eA,'BackgroundColor','r');
        throw(testeNum);
    end
    if ~(isscalar(b) && isreal(b))
        set(handles.eB,'BackgroundColor','r');
        throw(testeNum);
    end
    if ~(a<b)
        set(handles.eA,'BackgroundColor','r');
        set(handles.eB,'BackgroundColor','r');
        throw(testeAB);
    end
    if ~(isscalar(n) && isreal(n) && n>0)
        set(handles.eN,'BackgroundColor','r');
        throw(testeN);
    end


    switch escolha
        case 1
            intFT = RTrapezios(f,a,b,n);
            erroT = abs(intF-intFT);
            tabela = [intF, intFT, erroT];
            set(handles.uitable,'Data',num2cell(tabela));
            set(handles.uitable,'ColumnName',[{'Exata'},{'Trapezios'},{'ErroTrap'}]);
        case 2
            intFS = RSimpson(f,a,b,n);
            erroS = abs(intF-intFS);
            tabela = [intF, intFS, erroS];
            set(handles.uitable,'Data',num2cell(tabela));
            set(handles.uitable,'ColumnName',[{'Exata'},{'Simpson'},{'ErroSimp'}]);
        case 3
            intFQ = quad(f,a,b);
            erroQ = abs(intF-intFQ);
            tabela = [intF, intFQ, erroQ];
            set(handles.uitable,'Data',num2cell(tabela));
            set(handles.uitable,'ColumnName',[{'Exata'},{'Quad'},{'ErroQ'}]);
        case 4
            intNum = IntegrNum(f,a,b,n);
            erroS = abs(intF-intNum(1));
            erroT = abs(intF-intNum(2));
            erroQ = abs(intF-intNum(3));
            tabela = [intF, intNum(1), erroS, intNum(2), erroT, intNum(3), erroQ];
            set(handles.uitable,'Data',num2cell(tabela));
            set(handles.uitable,'ColumnName',[{'Exata'},{'Simpson'},{'ErroSimp'},...
                {'Trapezios'},{'ErroTrap'},{'Quad'},{'ErroQ'}]);
    end
    catch ME
    errordlg(ME.message,'Erro','modal');
end
