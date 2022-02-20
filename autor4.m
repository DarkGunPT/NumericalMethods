%   ArménioCorreia .: armenioc@isec.pt

%   Trabalho realizado por:
%   13/05/2020 André Lopes - 2019139754
%   13/05/2020 Nuno Honório - 2019126457
%   13/05/2020 Rafaela Carvalho - 2019127935
%   13/05/2020 Samuel Tavares - 2019126468

function varargout = autor4(varargin)
% AUTOR4 MATLAB code for autor4.fig
%      AUTOR4, by itself, creates a new AUTOR4 or raises the existing
%      singleton*.
%
%      H = AUTOR4 returns the handle to a new AUTOR4 or the handle to
%      the existing singleton*.
%
%      AUTOR4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUTOR4.M with the given input arguments.
%
%      AUTOR4('Property','Value',...) creates a new AUTOR4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before autor4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to autor4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help autor4

% Last Modified by GUIDE v2.5 29-Apr-2020 15:42:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @autor4_OpeningFcn, ...
                   'gui_OutputFcn',  @autor4_OutputFcn, ...
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


% --- Executes just before autor4 is made visible.
function autor4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to autor4 (see VARARGIN)

% Choose default command line output for autor4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui('center');
imshow('autores/samu.jpg', 'Parent', handles.iSamu);

% UIWAIT makes autor4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = autor4_OutputFcn(hObject, eventdata, handles) 
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
close(autor4);
Autores_GUI