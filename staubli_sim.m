function varargout = staubli_sim(varargin)
% STAUBLI_SIM MATLAB code for staubli_sim.fig
%      STAUBLI_SIM, by itself, creates a new STAUBLI_SIM or raises the existing
%      singleton*.
%
%      H = STAUBLI_SIM returns the handle to a new STAUBLI_SIM or the handle to
%      the existing singleton*.
%
%      STAUBLI_SIM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STAUBLI_SIM.M with the given input arguments.
%
%      STAUBLI_SIM('Property','Value',...) creates a new STAUBLI_SIM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before staubli_sim_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to staubli_sim_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help staubli_sim

% Last Modified by GUIDE v2.5 14-Dec-2022 20:27:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @staubli_sim_OpeningFcn, ...
                   'gui_OutputFcn',  @staubli_sim_OutputFcn, ...
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


% --- Executes just before staubli_sim is made visible.
function staubli_sim_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to staubli_sim (see VARARGIN)

                 % ALPHA         % A         % D     % THETA     % PHASE
staticMatrix = [       0,          0,          0,          0,          0;   ...
                     -pi,        406,        100,          0,          0;   ...
                       0,        394,          0,          0,          0;   ...
                       0,          0,        124,          0,          0;   ];
               
handles.alpha1_text.String = num2str(staticMatrix(1,1)*180/pi);
handles.alpha2_text.String = num2str(staticMatrix(2,1)*180/pi);
handles.alpha3_text.String = num2str(staticMatrix(3,1)*180/pi);
handles.alpha4_text.String = num2str(staticMatrix(4,1)*180/pi);

handles.a1_text.String = num2str(staticMatrix(1,2));
handles.a2_text.String = num2str(staticMatrix(2,2));
handles.a3_text.String = num2str(staticMatrix(3,2));
handles.a4_text.String = num2str(staticMatrix(4,2));

handles.d1_text.String = num2str(staticMatrix(1,3));
handles.d2_text.String = num2str(staticMatrix(2,3));
handles.d3_text.String = num2str(staticMatrix(3,3));
handles.d4_text.String = num2str(staticMatrix(4,3));

handles.th1_text.String = num2str(staticMatrix(1,4));
handles.th2_text.String = num2str(staticMatrix(2,4));
handles.th3_text.String = num2str(staticMatrix(3,4));
handles.th4_text.String = num2str(staticMatrix(4,4));

handles.ph1_text.String = num2str(staticMatrix(1,5)*180/pi);
handles.ph2_text.String = num2str(staticMatrix(2,5)*180/pi);
handles.ph3_text.String = num2str(staticMatrix(3,5)*180/pi);
handles.ph4_text.String = num2str(staticMatrix(4,5)*180/pi);

set(handles.ph1_text,'Enable','off');
set(handles.ph2_text,'Enable','off');
set(handles.ph3_text,'Enable','off');
set(handles.ph4_text,'Enable','off');

set(handles.th3_text,'Enable','off');

set(handles.slith1_text,'Enable','off');
set(handles.slith2_text,'Enable','off');
set(handles.slith3_text,'Enable','off');
set(handles.slith4_text,'Enable','off');

handles.check_phase = 1;
handles.staticMatrix = staticMatrix;


% Choose default command line output for staubli_sim
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes staubli_sim wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = staubli_sim_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slith1_text_Callback(hObject, eventdata, handles)
% hObject    handle to slith1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
slith1 = get(handles.slith1_text,'Value');

handles.th1_text.String = num2str(slith1);

th1 = str2double(handles.th1_text.String)*pi/180;
th2 = str2double(handles.th2_text.String)*pi/180;
th3 = str2double(handles.th3_text.String)*pi/180;
th4 = str2double(handles.th4_text.String)*pi/180;

ph1 = str2double(handles.ph1_text.String)*pi/180;
ph2 = str2double(handles.ph2_text.String)*pi/180;
ph3 = str2double(handles.ph3_text.String)*pi/180;
ph4 = str2double(handles.ph4_text.String)*pi/180;

handles.Robot.plot([th1 + ph1, th2 + ph2, th3 + ph3, th4 + ph4],'tilesize',1024,'delay',0.1);

% Update handles structure
guidata(hObject, handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slith1_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slith1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slith2_text_Callback(hObject, eventdata, handles)
% hObject    handle to slith2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
slith2 = get(handles.slith2_text,'Value');

handles.th2_text.String = num2str(slith2);

th1 = str2double(handles.th1_text.String)*pi/180;
th2 = str2double(handles.th2_text.String)*pi/180;
th3 = str2double(handles.th3_text.String)*pi/180;
th4 = str2double(handles.th4_text.String)*pi/180;

ph1 = str2double(handles.ph1_text.String)*pi/180;
ph2 = str2double(handles.ph2_text.String)*pi/180;
ph3 = str2double(handles.ph3_text.String)*pi/180;
ph4 = str2double(handles.ph4_text.String)*pi/180;

handles.Robot.plot([th1 + ph1, th2 + ph2, th3 + ph3, th4 + ph4],'tilesize',1024,'delay',0.1)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slith2_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slith2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slith3_text_Callback(hObject, eventdata, handles)
% hObject    handle to slith3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
slith3 = get(handles.slith3_text,'Value');

handles.d3_text.String = num2str(slith3);

th1 = str2double(handles.th1_text.String)*pi/180;
th2 = str2double(handles.th2_text.String)*pi/180;
d3 = str2double(handles.d3_text.String);
th4 = str2double(handles.th4_text.String)*pi/180;

ph1 = str2double(handles.ph1_text.String)*pi/180;
ph2 = str2double(handles.ph2_text.String)*pi/180;
ph4 = str2double(handles.ph4_text.String)*pi/180;

handles.Robot.plot([th1 + ph1, th2 + ph2, d3 , th4 + ph4],'tilesize',1024,'delay',0.1)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slith3_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slith3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slith4_text_Callback(hObject, eventdata, handles)
% hObject    handle to slith4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
slith4 = get(handles.slith4_text,'Value');

handles.th4_text.String = num2str(slith4);

th1 = str2double(handles.th1_text.String)*pi/180;
th2 = str2double(handles.th2_text.String)*pi/180;
th3 = str2double(handles.th3_text.String)*pi/180;
th4 = str2double(handles.th4_text.String)*pi/180;

ph1 = str2double(handles.ph1_text.String)*pi/180;
ph2 = str2double(handles.ph2_text.String)*pi/180;
ph3 = str2double(handles.ph3_text.String)*pi/180;
ph4 = str2double(handles.ph4_text.String)*pi/180;

handles.Robot.plot([th1 + ph1, th2 + ph2, th3 + ph3, th4 + ph4],'tilesize',1024,'delay',0.1)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slith4_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slith4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in reset_button.
function reset_button_Callback(hObject, eventdata, handles)
% hObject    handle to reset_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.alpha1_text.String = num2str(handles.staticMatrix(1,1)*180/pi);
handles.alpha2_text.String = num2str(handles.staticMatrix(2,1)*180/pi);
handles.alpha3_text.String = num2str(handles.staticMatrix(3,1)*180/pi);
handles.alpha4_text.String = num2str(handles.staticMatrix(4,1)*180/pi);

handles.a1_text.String = num2str(handles.staticMatrix(1,2));
handles.a2_text.String = num2str(handles.staticMatrix(2,2));
handles.a3_text.String = num2str(handles.staticMatrix(3,2));
handles.a4_text.String = num2str(handles.staticMatrix(4,2));

handles.d1_text.String = num2str(handles.staticMatrix(1,3));
handles.d2_text.String = num2str(handles.staticMatrix(2,3));
handles.d3_text.String = num2str(handles.staticMatrix(3,3));
handles.d4_text.String = num2str(handles.staticMatrix(4,3));

handles.th1_text.String = num2str(handles.staticMatrix(1,4));
handles.th2_text.String = num2str(handles.staticMatrix(2,4));
handles.th3_text.String = num2str(handles.staticMatrix(3,4));
handles.th4_text.String = num2str(handles.staticMatrix(4,4));

handles.ph1_text.String = num2str(handles.staticMatrix(1,5)*180/pi);
handles.ph2_text.String = num2str(handles.staticMatrix(2,5)*180/pi);
handles.ph3_text.String = num2str(handles.staticMatrix(3,5)*180/pi);
handles.ph4_text.String = num2str(handles.staticMatrix(4,5)*180/pi);

set(handles.ph1_text,'Enable','off');
set(handles.ph2_text,'Enable','off');
set(handles.ph3_text,'Enable','off');
set(handles.ph4_text,'Enable','off');

ncols = 4;
set(handles.t01_table,'data',cell(ncols, ncols));
set(handles.t12_table,'data',cell(ncols, ncols));
set(handles.t23_table,'data',cell(ncols, ncols));
set(handles.t34_table,'data',cell(ncols, ncols));

set(handles.t04_table,'data',cell(ncols, ncols));

ncols2 = 6;
set(handles.numJaco_table,'data',cell(ncols2, ncols));

cla(handles.axes1,'reset');

set(handles.pointx,'string',' ');
set(handles.pointy,'string',' ');
set(handles.pointz,'string',' ');

set(handles.slith1_text,'Value',0);
set(handles.slith2_text,'Value',0);
set(handles.slith3_text,'Value',0);
set(handles.slith4_text,'Value',0);

set(handles.slith1_text,'Enable','off');
set(handles.slith2_text,'Enable','off');
set(handles.slith3_text,'Enable','off');
set(handles.slith4_text,'Enable','off');

handles.check_phase = 1;

% Update handles structure
guidata(hObject, handles);



function alpha1_text_Callback(hObject, eventdata, handles)
% hObject    handle to alpha1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha1_text as text
%        str2double(get(hObject,'String')) returns contents of alpha1_text as a double


% --- Executes during object creation, after setting all properties.
function alpha1_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha2_text_Callback(hObject, eventdata, handles)
% hObject    handle to alpha2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha2_text as text
%        str2double(get(hObject,'String')) returns contents of alpha2_text as a double


% --- Executes during object creation, after setting all properties.
function alpha2_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha3_text_Callback(hObject, eventdata, handles)
% hObject    handle to alpha3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha3_text as text
%        str2double(get(hObject,'String')) returns contents of alpha3_text as a double


% --- Executes during object creation, after setting all properties.
function alpha3_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha4_text_Callback(hObject, eventdata, handles)
% hObject    handle to alpha4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha4_text as text
%        str2double(get(hObject,'String')) returns contents of alpha4_text as a double


% --- Executes during object creation, after setting all properties.
function alpha4_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a1_text_Callback(hObject, eventdata, handles)
% hObject    handle to a1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a1_text as text
%        str2double(get(hObject,'String')) returns contents of a1_text as a double


% --- Executes during object creation, after setting all properties.
function a1_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a2_text_Callback(hObject, eventdata, handles)
% hObject    handle to a2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a2_text as text
%        str2double(get(hObject,'String')) returns contents of a2_text as a double


% --- Executes during object creation, after setting all properties.
function a2_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a3_text_Callback(hObject, eventdata, handles)
% hObject    handle to a3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a3_text as text
%        str2double(get(hObject,'String')) returns contents of a3_text as a double


% --- Executes during object creation, after setting all properties.
function a3_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a4_text_Callback(hObject, eventdata, handles)
% hObject    handle to a4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a4_text as text
%        str2double(get(hObject,'String')) returns contents of a4_text as a double


% --- Executes during object creation, after setting all properties.
function a4_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d1_text_Callback(hObject, eventdata, handles)
% hObject    handle to d1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d1_text as text
%        str2double(get(hObject,'String')) returns contents of d1_text as a double


% --- Executes during object creation, after setting all properties.
function d1_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d2_text_Callback(hObject, eventdata, handles)
% hObject    handle to d2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d2_text as text
%        str2double(get(hObject,'String')) returns contents of d2_text as a double


% --- Executes during object creation, after setting all properties.
function d2_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d3_text_Callback(hObject, eventdata, handles)
% hObject    handle to d3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d3_text as text
%        str2double(get(hObject,'String')) returns contents of d3_text as a double


% --- Executes during object creation, after setting all properties.
function d3_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d4_text_Callback(hObject, eventdata, handles)
% hObject    handle to d4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d4_text as text
%        str2double(get(hObject,'String')) returns contents of d4_text as a double


% --- Executes during object creation, after setting all properties.
function d4_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function th1_text_Callback(hObject, eventdata, handles)
% hObject    handle to th1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of th1_text as text
%        str2double(get(hObject,'String')) returns contents of th1_text as a double


% --- Executes during object creation, after setting all properties.
function th1_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to th1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function th2_text_Callback(hObject, eventdata, handles)
% hObject    handle to th2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of th2_text as text
%        str2double(get(hObject,'String')) returns contents of th2_text as a double


% --- Executes during object creation, after setting all properties.
function th2_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to th2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function th4_text_Callback(hObject, eventdata, handles)
% hObject    handle to th4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of th4_text as text
%        str2double(get(hObject,'String')) returns contents of th4_text as a double


% --- Executes during object creation, after setting all properties.
function th4_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to th4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calc_button.
function calc_button_Callback(hObject, eventdata, handles)
% hObject    handle to calc_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
alpha1 = str2double(handles.alpha1_text.String)*pi/180;
alpha2 = str2double(handles.alpha2_text.String)*pi/180;
alpha3 = str2double(handles.alpha3_text.String)*pi/180;
alpha4 = str2double(handles.alpha4_text.String)*pi/180;

a1 = str2double(handles.a1_text.String);
a2 = str2double(handles.a2_text.String);
a3 = str2double(handles.a3_text.String);
a4 = str2double(handles.a4_text.String);

d1 = str2double(handles.d1_text.String);
d2 = str2double(handles.d2_text.String);
d3 = str2double(handles.d3_text.String);
d4 = str2double(handles.d4_text.String);

th1 = str2double(handles.th1_text.String)*pi/180;
th2 = str2double(handles.th2_text.String)*pi/180;
th3 = str2double(handles.th3_text.String)*pi/180;
th4 = str2double(handles.th4_text.String)*pi/180;

ph1 = str2double(handles.ph1_text.String)*pi/180;
ph2 = str2double(handles.ph2_text.String)*pi/180;
ph3 = str2double(handles.ph3_text.String)*pi/180;
ph4 = str2double(handles.ph4_text.String)*pi/180;

set(handles.slith1_text,'Value',th1*180/pi);
set(handles.slith2_text,'Value',th2*180/pi);
set(handles.slith3_text,'Value',th3*180/pi);
set(handles.slith4_text,'Value',th4*180/pi);


              % ALPHA         % A         % D       % THETA
dhMatrix = [  alpha1,         a1,         d1,      th1 + ph1;   ...
              alpha2,         a2,         d2,      th2 + ph2;   ...
              alpha3,         a3,         d3,      th3 + ph3;   ...
              alpha4,         a4,         d4,      th4 + ph4;   ];
              
for row = 1:length(dhMatrix)
    alpha = dhMatrix(row,1);
    a = dhMatrix(row,2);
    d = dhMatrix(row,3);
    theta = dhMatrix(row,4);  
    
    T(:,:,row) =  [            cos(theta)             -sin(theta)             0               a;    ...
                    sin(theta)*cos(alpha)   cos(theta)*cos(alpha)   -sin(alpha)   -d*sin(alpha);    ...
                    sin(theta)*sin(alpha)	cos(theta)*sin(alpha)	 cos(alpha)    d*cos(alpha);    ...
                                        0                       0             0               1;    ];
end

if (isa(T,'sym'))
    T_tmp = sym(eye(4,4));
else  
    T_tmp = eye(4,4);
end

for i=1:length(T)
        T_tmp = T_tmp * T(:,:,i);
end

        T_out = T_tmp;

set(handles.t01_table,'data',round(T(:,:,1)));
set(handles.t12_table,'data',round(T(:,:,2)));
set(handles.t23_table,'data',round(T(:,:,3)));
set(handles.t34_table,'data',round(T(:,:,4)));

set(handles.t04_table,'data',round(T_out));

%%%% 3D ROBOT SIMULATION %%%%
% Modified Denavit Hartenberg Parameters
            %th             %d      %a      %alpha
L(1) = Link([th1 + ph1      d1      a1      alpha1 0],    'modified');
L(2) = Link([th2 + ph2      d2      a2      alpha2 0],    'modified');
L(3) = Link([th3 + ph3      d3      a3      alpha3 1],    'modified');
L(4) = Link([th4 + ph4      d4      a4      alpha4 0],    'modified');
L(3).qlim = [0 100];

handles.Robot = SerialLink(L);
handles.Robot.name = 'Staubli TP80';
handles.Robot.plot([th1 + ph1, th2 + ph2, th3 + ph3, th4 + ph4]);

Tsim = handles.Robot.fkine([th1 + ph1, th2 + ph2, th3 + ph3, th4 + ph4]);
 
handles.pointx.String = num2str(floor(Tsim.t(1)));
handles.pointy.String = num2str(floor(Tsim.t(2)));
handles.pointz.String = num2str(floor(Tsim.t(3)));

set(handles.slith1_text,'Enable','on');
set(handles.slith2_text,'Enable','on');
set(handles.slith3_text,'Enable','on');
set(handles.slith4_text,'Enable','on');

% Update handles structure
guidata(hObject, handles);



function ph1_text_Callback(hObject, eventdata, handles)
% hObject    handle to ph1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ph1_text as text
%        str2double(get(hObject,'String')) returns contents of ph1_text as a double


% --- Executes during object creation, after setting all properties.
function ph1_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ph1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ph2_text_Callback(hObject, eventdata, handles)
% hObject    handle to ph2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ph2_text as text
%        str2double(get(hObject,'String')) returns contents of ph2_text as a double


% --- Executes during object creation, after setting all properties.
function ph2_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ph2_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ph3_text_Callback(hObject, eventdata, handles)
% hObject    handle to ph3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ph3_text as text
%        str2double(get(hObject,'String')) returns contents of ph3_text as a double


% --- Executes during object creation, after setting all properties.
function ph3_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ph3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ph4_text_Callback(hObject, eventdata, handles)
% hObject    handle to ph4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ph4_text as text
%        str2double(get(hObject,'String')) returns contents of ph4_text as a double


% --- Executes during object creation, after setting all properties.
function ph4_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ph4_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in phase_button.
function phase_button_Callback(hObject, eventdata, handles)
% hObject    handle to phase_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.check_phase
    set(handles.ph1_text,'Enable','on');
    set(handles.ph2_text,'Enable','on');
    set(handles.ph3_text,'Enable','on');
    set(handles.ph4_text,'Enable','on');
    
    handles.check_phase = 0;
else
    set(handles.ph1_text,'Enable','off');
    set(handles.ph2_text,'Enable','off');
    set(handles.ph3_text,'Enable','off');
    set(handles.ph4_text,'Enable','off');
    
    handles.check_phase = 1;
end

% Update handles structure
guidata(hObject, handles);



function th3_text_Callback(hObject, eventdata, handles)
% hObject    handle to th3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of th3_text as text
%        str2double(get(hObject,'String')) returns contents of th3_text as a double


% --- Executes during object creation, after setting all properties.
function th3_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to th3_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pointx_Callback(hObject, eventdata, handles)
% hObject    handle to pointx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pointx as text
%        str2double(get(hObject,'String')) returns contents of pointx as a double


% --- Executes during object creation, after setting all properties.
function pointx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pointx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pointy_Callback(hObject, eventdata, handles)
% hObject    handle to pointy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pointy as text
%        str2double(get(hObject,'String')) returns contents of pointy as a double


% --- Executes during object creation, after setting all properties.
function pointy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pointy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pointz_Callback(hObject, eventdata, handles)
% hObject    handle to pointz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pointz as text
%        str2double(get(hObject,'String')) returns contents of pointz as a double


% --- Executes during object creation, after setting all properties.
function pointz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pointz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in jacocalc_button.
function jacocalc_button_Callback(hObject, eventdata, handles)
% hObject    handle to jacocalc_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms the1 the2 the3 the4;

ths = [the1, the2, the3, the4];

alpha1 = str2double(handles.alpha1_text.String)*pi/180;
alpha2 = str2double(handles.alpha2_text.String)*pi/180;
alpha3 = str2double(handles.alpha3_text.String)*pi/180;
alpha4 = str2double(handles.alpha4_text.String)*pi/180;

a1 = str2double(handles.a1_text.String);
a2 = str2double(handles.a2_text.String);
a3 = str2double(handles.a3_text.String);
a4 = str2double(handles.a4_text.String);

d1 = str2double(handles.d1_text.String);
d2 = str2double(handles.d2_text.String);
d3 = str2double(handles.d3_text.String);
d4 = str2double(handles.d4_text.String);

th1 = str2double(handles.th1_text.String)*pi/180;
th2 = str2double(handles.th2_text.String)*pi/180;
th3 = str2double(handles.th3_text.String)*pi/180;
th4 = str2double(handles.th4_text.String)*pi/180;

num_ths = [th1, th2, th3, th4];

ph1 = str2double(handles.ph1_text.String)*pi/180;
ph2 = str2double(handles.ph2_text.String)*pi/180;
ph3 = str2double(handles.ph3_text.String)*pi/180;
ph4 = str2double(handles.ph4_text.String)*pi/180;

              % ALPHA         % A         % D       % THETA
dhMatrix = [  alpha1,         a1,         d1,      the1 + ph1;   ...
              alpha2,         a2,         d2,      the2 + ph2;   ...
              alpha3,         a3,         d3,      the3 + ph3;   ...
              alpha4,         a4,         d4,      the4 + ph4;   ];

for row = 1:length(dhMatrix)
    alpha = dhMatrix(row,1);
    a = dhMatrix(row,2);
    d = dhMatrix(row,3);
    theta = dhMatrix(row,4);  
    
    T(:,:,row) =  [            cos(theta)             -sin(theta)             0               a;    ...
                    sin(theta)*cos(alpha)   cos(theta)*cos(alpha)   -sin(alpha)   -d*sin(alpha);    ...
                    sin(theta)*sin(alpha)	cos(theta)*sin(alpha)	 cos(alpha)    d*cos(alpha);    ...
                                        0                       0             0               1;    ];
end

if (isa(T,'sym'))
    T_tmp = sym(eye(4,4));
else  
    T_tmp = eye(4,4);
end

for i=1:length(T)
    T_tmp = T_tmp * T(:,:,i);
    T_out(:,:,i) = T_tmp;
end

for k=1:length(T)
    Jv_tmp(:,:,k) = diff(T_out(1:3,:,end)*[0;0;0;1],ths(k));
    Jw_tmp(:,:,k) = T_out(1:3,1:3,k)*[0;0;1];
end

    Jv = [Jv_tmp(:,:,1),Jv_tmp(:,:,2),Jv_tmp(:,:,3),Jv_tmp(:,:,4)];
    Jw = [Jw_tmp(:,:,1),Jw_tmp(:,:,2),Jw_tmp(:,:,3),Jw_tmp(:,:,4)];
    J = [Jv; Jw];
    %simplify(J);
   
    num_J = vpa(subs(J,ths,num_ths));
    
    set(handles.numJaco_table,'data',double(num_J));


% --- Executes on button press in invcalc_button.
function invcalc_button_Callback(hObject, eventdata, handles)
% hObject    handle to invcalc_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms th1 th2 th4 d3 r11 r12 r13 r21 r22 r23 r31 r32 r33

alpha1 = str2double(handles.alpha1_text.String)*pi/180;
alpha2 = str2double(handles.alpha2_text.String)*pi/180;
alpha3 = str2double(handles.alpha3_text.String)*pi/180;
alpha4 = str2double(handles.alpha4_text.String)*pi/180;

a1 = str2double(handles.a1_text.String);
a2 = str2double(handles.a2_text.String);
a3 = str2double(handles.a3_text.String);
a4 = str2double(handles.a4_text.String);

d1 = str2double(handles.d1_text.String);
d2 = str2double(handles.d2_text.String);
d4 = str2double(handles.d4_text.String);

th3 = str2double(handles.th3_text.String)*pi/180;
th4 = str2double(handles.th4_text.String)*pi/180;

ph1 = str2double(handles.ph1_text.String)*pi/180;
ph2 = str2double(handles.ph2_text.String)*pi/180;
ph3 = str2double(handles.ph3_text.String)*pi/180;
ph4 = str2double(handles.ph4_text.String)*pi/180;

                 % ALPHA         % A         % D        % THETA
dhMatrix = [           0           0           0           th1; ...
                       0         406         100           th2; ...
                       0         394          d3             0; ...
                       0           0         124           th4];
                   
for row = 1:length(dhMatrix)
    alpha = dhMatrix(row,1);
    a = dhMatrix(row,2);
    d = dhMatrix(row,3);
    theta = dhMatrix(row,4);  
    
    T(:,:,row) =  [            cos(theta)             -sin(theta)             0               a;    ...
                    sin(theta)*cos(alpha)   cos(theta)*cos(alpha)   -sin(alpha)   -d*sin(alpha);    ...
                    sin(theta)*sin(alpha)	cos(theta)*sin(alpha)	 cos(alpha)    d*cos(alpha);    ...
                                        0                       0             0               1;    ];
end

T01 = T(:,:,1);
T12 = T(:,:,2);
T23 = T(:,:,3);
T34 = T(:,:,4);

px = str2double(handles.pointx.String);
py = str2double(handles.pointy.String);
pz = str2double(handles.pointz.String);

T14 = T12*T23*T34;

% T04s = [ r11 r12 r13 px; r21 r22 r23 py; r31 r32 r33 pz; 0 0 0 1];

T_eqv1 = simplify(inv(T01)*[ r11 r12 r13 px; r21 r22 r23 py; r31 r32 r33 pz; 0 0 0 1]);

eqv1 = simplify(T14(1,4)-T_eqv1(1,4));
eqv2 = simplify(T14(2,4)-T_eqv1(2,4));
eqv3 = simplify(T14(3,4)-T_eqv1(3,4));

[th1 th2] = solve(eqv1, eqv2);
[d3] = solve(eqv3);
th1 = double(abs(th1(1))*180/pi);
th2 = double(abs(th2(1))*180/pi);
d3 = double(d3);

%%%% 3D ROBOT SIMULATION %%%%
% Modified Denavit Hartenberg Parameters
            %th             %d      %a      %alpha
L(1) = Link([th1 + ph1      d1      a1      alpha1 0],    'modified');
L(2) = Link([th2 + ph2      d2      a2      alpha2 0],    'modified');
L(3) = Link([th3 + ph3      d3      a3      alpha3 1],    'modified');
L(4) = Link([th4 + ph4      d4      a4      alpha4 0],    'modified');
L(3).qlim = [0 100];

handles.th1_text.String = num2str(th1);
handles.th2_text.String = num2str(th2);
handles.d3_text.String = num2str(d3);

handles.Invrobot = SerialLink(L);
handles.Invrobot.name = 'Staubli TP80';
handles.Invrobot.plot([th1 + ph1, th2 + ph2, d3, th4 + ph4]);
