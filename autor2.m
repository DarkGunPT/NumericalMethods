%   ArménioCorreia .: armenioc@isec.pt

%   Trabalho realizado por:
%   13/05/2020 André Lopes - 2019139754
%   13/05/2020 Nuno Honório - 2019126457
%   13/05/2020 Rafaela Carvalho - 2019127935
%   13/05/2020 Samuel Tavares - 2019126468

function varargout = autor2(varargin)
% AUTOR2 MATLAB code for autor2.fig
%      AUTOR2, by itself, creates a new AUTOR2 or raises the existing
%      singleton*.
%
%      H = AUTOR2 returns the handle to a new AUTOR2 or the handle to
%      the existing singleton*.
%
%      AUTOR2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUTOR2.M with the given input arguments.
%
%      AUTOR2('Property','Value',...) creates a new AUTOR2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before autor2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to autor2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help autor2

% Last Modified by GUIDE v2.5 29-Apr-2020 16:27:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @autor2_OpeningFcn, ...
                   'gui_OutputFcn',  @autor2_OutputFcn, ...
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


% --- Executes just before autor2 is made visible.
function autor2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to autor2 (see VARARGIN)

% Choose default command line output for autor2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui('center');
imshow('autores/nuno.jpg', 'Parent', handles.iNuno);

% UIWAIT makes autor2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = autor2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bVoltar.
function bVoltar_Callback(hObject, eventdata, handles)
% hObject    handle to bVoltar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(autor2);
Autores_GUI