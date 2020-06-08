function varargout = GUI_lung_cancer_recognition(varargin)
% GUI_LUNG_CANCER_RECOGNITION MATLAB code for GUI_lung_cancer_recognition.fig
%      GUI_LUNG_CANCER_RECOGNITION, by itself, creates a new GUI_LUNG_CANCER_RECOGNITION or raises the existing
%      singleton*.
%
%      H = GUI_LUNG_CANCER_RECOGNITION returns the handle to a new GUI_LUNG_CANCER_RECOGNITION or the handle to
%      the existing singleton*.
%
%      GUI_LUNG_CANCER_RECOGNITION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_LUNG_CANCER_RECOGNITION.M with the given input arguments.
%
%      GUI_LUNG_CANCER_RECOGNITION('Property','Value',...) creates a new GUI_LUNG_CANCER_RECOGNITION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_lung_cancer_recognition_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_lung_cancer_recognition_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_lung_cancer_recognition

% Last Modified by GUIDE v2.5 24-Dec-2017 00:43:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_lung_cancer_recognition_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_lung_cancer_recognition_OutputFcn, ...
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


% --- Executes just before GUI_lung_cancer_recognition is made visible.
function GUI_lung_cancer_recognition_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_lung_cancer_recognition (see VARARGIN)

% Choose default command line output for GUI_lung_cancer_recognition
handles.output = hObject;
axes(handles.logo)
matlabImage = imread('D:\IB_in¿ynierka\Aplikacja\logo.png');
image(matlabImage)
axis off
axis image

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_lung_cancer_recognition wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_lung_cancer_recognition_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in choose.
function choose_Callback(hObject, eventdata, handles)
% hObject    handle to choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im2
[path, user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Error'),'Error','Error');
    return
end
im=imread(path);
im=im2double(im); %zamiana na double
im2=im; %rezerwa
axes(handles.picture); %pokazanie wybranego zdjêcia w GUI
imshow(im);


% --- Executes on button press in binarization.
function binarization_Callback(hObject, eventdata, handles)
% hObject    handle to binarization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
hold off
%Uczenie programu
%rak1
[L1]= imread('rak1.png');
L1=rgb2gray(L1); %obraz do skali monochromatycznej
L1=im2bw(L1,0.35); %binaryzacja obrazu z progiem 0.35
rak1= bwarea(L1); %obliczenie pola obiektu obrazu
%rak2
[L2]= imread('rak2.png');
L2=rgb2gray(L2);
L2=im2bw(L2,0.35);
rak2= bwarea(L2);
%rak3
[L3]= imread('rak3.png');
L3=rgb2gray(L3);
L3=im2bw(L3,0.35);
rak3= bwarea(L3);
%rak4
[L4]= imread('rak4.png');
L4=rgb2gray(L4);
L4=im2bw(L4,0.35);
rak4= bwarea(L4);
%rak5
[L5]= imread('rak5.png');
L5=rgb2gray(L5);
L5=im2bw(L5,0.35);
rak5= bwarea(L5);
%***********************
%zdrowe1
[Z1]= imread('zdrowy1.png');
Z1=rgb2gray(Z1);
Z1=im2bw(Z1,0.35);
zdrowe1= bwarea(Z1);
%zdrowe2
[Z2]= imread('zdrowy2.png');
Z2=rgb2gray(Z2);
Z2=im2bw(Z2,0.35);
zdrowe2= bwarea(Z2);
%zdrowe3
[Z3]= imread('zdrowy3.png');
Z3=rgb2gray(Z3);
Z3=im2bw(Z3,0.35);
zdrowe3= bwarea(Z3);
%zdrowe4
[Z4]= imread('zdrowy4.png');
Z4=rgb2gray(Z4);
Z4=im2bw(Z4,0.35);
zdrowe4= bwarea(Z4);
%zdrowe5
[Z5]= imread('zdrowy5.png');
Z5=rgb2gray(Z5);
Z5=im2bw(Z5,0.35);
zdrowe5= bwarea(Z5);

%identyfikowanie
im=rgb2gray(im);
L=im2bw(im, 0.35); %binaryzacja wczytanego obrazu z progiem 0.35
axes(handles.processed_picture); %wyswietlenie przetworzonego obrazu w GUI
imshow(L);

test= bwarea(L);

SL = [rak1; rak2;rak3; rak4; rak5; zdrowe1; zdrowe2; zdrowe3; zdrowe4; zdrowe5]; %wzorzec
group = ['rakowe'; 'rakowe';'rakowe'; 'rakowe'; 'rakowe'; 'zdrowe'; 'zdrowe'; 'zdrowe'; 'zdrowe'; 'zdrowe'];
%klasyfikacja
nb = NaiveBayes.fit(SL,group)
X=test;
y=nb.predict(X);
%wyswietlenie wyniku
set(handles.diagnosis, 'String', y);


% --- Executes on button press in histograms.
function histograms_Callback(hObject, eventdata, handles)
% hObject    handle to histograms (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
hold off
%identyfikowanie
im=rgb2gray(im);
axes(handles.processed_picture); %wyswietlenie przetworzonego obrazu
[y, x]=imhist(im); %obliczenie histogramu
bar(x,y);
test=y;
%uczenie
%rak1
[L1]= imread('rak1.png');
L1=rgb2gray(L1);
[y, x]=imhist(L1);
rak1=y;
%rak2
[L2]= imread('rak2.png');
L2=rgb2gray(L2);
[y, x]=imhist(L2);
rak2=y;
%rak3
[L3]= imread('rak3.png');
L3=rgb2gray(L3);
[y, x]=imhist(L3);
rak3=y;
%rak4
[L4]= imread('rak4.png');
L4=rgb2gray(L4);
[y, x]=imhist(L4);
rak4=y;
%rak5
[L5]= imread('rak5.png');
L5=rgb2gray(L5);
[y, x]=imhist(L5);
rak5=y;
%***********************
%zdrowe1
[Z1]= imread('zdrowy1.png');
Z1=rgb2gray(Z1);
[y, x]=imhist(Z1);
zdrowe1=y;
%zdrowe2
[Z2]= imread('zdrowy2.png');
Z2=rgb2gray(Z2);
[y, x]=imhist(Z2);
zdrowe2=y;
%zdrowe3
[Z3]= imread('zdrowy3.png');
Z3=rgb2gray(Z3);
[y, x]=imhist(Z3);
zdrowe3=y;
%zdrowe4
[Z4]= imread('zdrowy4.png');
Z4=rgb2gray(Z4);
[y, x]=imhist(Z4);
zdrowe4=y;
%zdrowe5
[Z5]= imread('zdrowy5.png');
Z5=rgb2gray(Z5);
[y, x]=imhist(Z5);
zdrowe5=y;

%klasyfikacja
distance1=sum(abs(test-rak1)) %obliczony zostaje dystans miedzy punktami obrazu testowego a obrazami ze zbioru uczacego, nastepnie sumowany
distance2=sum(abs(test-rak2))
distance3=sum(abs(test-rak3))
distance4=sum(abs(test-rak4))
distance5=sum(abs(test-rak5))
distance6=sum(abs(test-zdrowe1))
distance7=sum(abs(test-zdrowe2))
distance8=sum(abs(test-zdrowe3))
distance9=sum(abs(test-zdrowe4))
distance10=sum(abs(test-zdrowe5))

distance = [distance1 distance2 distance3 distance4 distance5 distance6 distance7 distance8 distance9 distance10];
[M1,I1] = min(distance.') %szukanie kolejnych najmniejszych wartosci w wektorze distance
distance(I1) = inf;
[M2,I2] = min(distance.')
distance(I2) = inf;
[M3,I3] = min(distance.')

group = ['rakowe'; 'rakowe';'rakowe'; 'rakowe'; 'rakowe'; 'zdrowe'; 'zdrowe'; 'zdrowe'; 'zdrowe'; 'zdrowe'];
neighbours=[group(I1) group(I2) group(I3)]; %wektor klas najbli¿szych s¹siadów

A=unique(neighbours);
out=histc(neighbours,A);

%wyswietlenie wyniku klasyfikacji
if out(1)>=2
    set(handles.diagnosis, 'String', 'rakowe');
else if out(2)>=2
        set(handles.diagnosis, 'String', 'zdrowe');
    end
end


    


% --- Executes on button press in kolowosci.
function kolowosci_Callback(hObject, eventdata, handles)
% hObject    handle to kolowosci (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
hold off
%uczenie
%rak1
[L1]= imread('rak1.png');
L1=rgb2gray(L1);
L1=im2bw(L1,0.4);
H=fspecial('disk', 8); %tworze filtr, ktory rozmarze obraz
F=imfilter(L1, H);  %stosuje filtr na moim obrazie
[B,L] = bwboundaries(F); %obliczenie krawêdzi
Region = regionprops(L,'Area','Centroid', 'Perimeter');
rak1L=0; rak1S=0;
for n = 1:length(B) % iteracja po obiektach

      perimeter = Region(n).Perimeter;       
      area = Region(n).Area;              
      wkoL = 2*(area/pi).^0.5;   % wspó³czynnik ko³owosci1
      wkoS = (perimeter/pi);     %wspolczynnik kolowosci2
      rak1L=rak1L + wkoL;
      rak1S=rak1S + wkoS;
end
%rak2
[L2]= imread('rak2.png');
L2=rgb2gray(L2);
L2=im2bw(L2,0.4);
H=fspecial('disk', 8);
F=imfilter(L2, H);
[B,L] = bwboundaries(F);
Region = regionprops(L,'Area','Centroid', 'Perimeter');
rak2L=0; rak2S=0;
for n = 1:length(B)

      perimeter = Region(n).Perimeter;       
      area = Region(n).Area;              
      wkoL = 2*(area/pi).^0.5;
      wkoS = (perimeter/pi);
      rak2L=rak2L + wkoL;
      rak2S=rak2S + wkoS;
end
%rak3
[L3]= imread('rak3.png');
L3=rgb2gray(L3);
L3=im2bw(L3,0.4);
H=fspecial('disk', 8); 
F=imfilter(L3, H); 
[B,L] = bwboundaries(F);
Region = regionprops(L,'Area','Centroid', 'Perimeter');
rak3L=0; rak3S=0;
for n = 1:length(B)

      perimeter = Region(n).Perimeter;       
      area = Region(n).Area;              
      wkoL = 2*(area/pi).^0.5;
      wkoS = (perimeter/pi);
      rak3L=rak3L + wkoL;
      rak3S=rak3S + wkoS;
end
%rak4
[L4]= imread('rak4.png');
L4=rgb2gray(L4);
L4=im2bw(L4,0.4);
H=fspecial('disk', 8);
F=imfilter(L4, H);
[B,L] = bwboundaries(F);
Region = regionprops(L,'Area','Centroid', 'Perimeter');
rak4L=0; rak4S=0;
for n = 1:length(B)

      perimeter = Region(n).Perimeter;       
      area = Region(n).Area;              
      wkoL = 2*(area/pi).^0.5;
      wkoS = (perimeter/pi);
      rak4L=rak4L + wkoL;
      rak4S=rak4S + wkoS;
end
%rak5
[L5]= imread('rak5.png');
L5=rgb2gray(L5);
L5=im2bw(L5,0.4);
H=fspecial('disk', 8);
F=imfilter(L5, H);
[B,L] = bwboundaries(F);
Region = regionprops(L,'Area','Centroid', 'Perimeter');
rak5L=0; rak5S=0;
for n = 1:length(B)

      perimeter = Region(n).Perimeter;       
      area = Region(n).Area;              
      wkoL = 2*(area/pi).^0.5;
      wkoS = (perimeter/pi);
      rak5L=rak5L + wkoL;
      rak5S=rak5S + wkoS;
end
%***********************
%zdrowe1
[Z1]= imread('zdrowy1.png');
Z1=rgb2gray(Z1);
Z1=im2bw(Z1,0.4);
H=fspecial('disk', 8); 
F=imfilter(Z1, H);
[B,L] = bwboundaries(F);
Region = regionprops(L,'Area','Centroid', 'Perimeter');
zdrowe1L=0; zdrowe1S=0;
for n = 1:length(B) 
    
      perimeter = Region(n).Perimeter;       
      area = Region(n).Area;              
      wkoL = 2*(area/pi).^0.5; 
      wkoS = (perimeter/pi);
      zdrowe1L=zdrowe1L + wkoL;
      zdrowe1S=zdrowe1S + wkoS;
end
%zdrowe2
[Z2]= imread('zdrowy2.png');
Z2=rgb2gray(Z2);
Z2=im2bw(Z2,0.4);
H=fspecial('disk', 8);
F=imfilter(Z2, H);
[B,L] = bwboundaries(F);
Region = regionprops(L,'Area','Centroid', 'Perimeter');
zdrowe2L=0; zdrowe2S=0;
for n = 1:length(B)

      perimeter = Region(n).Perimeter;       
      area = Region(n).Area;              
      wkoL = 2*(area/pi).^0.5;
      wkoS = (perimeter/pi);
      zdrowe2L=zdrowe2L + wkoL;
      zdrowe2S=zdrowe2S + wkoS;
end
%zdrowe3
[Z3]= imread('zdrowy3.png');
Z3=rgb2gray(Z3);
Z3=im2bw(Z3,0.4);
H=fspecial('disk', 8);
F=imfilter(Z3, H);
[B,L] = bwboundaries(F);
Region = regionprops(L,'Area','Centroid', 'Perimeter');
zdrowe3L=0; zdrowe3S=0;
for n = 1:length(B)

      perimeter = Region(n).Perimeter;       
      area = Region(n).Area;              
      wkoL = 2*(area/pi).^0.5; 
      wkoS = (perimeter/pi);
      zdrowe3L=zdrowe3L + wkoL;
      zdrowe3S=zdrowe3S + wkoS;
end
%zdrowe4
[Z4]= imread('zdrowy4.png');
Z4=rgb2gray(Z4);
Z4=im2bw(Z4,0.4);
H=fspecial('disk', 8);
F=imfilter(Z4, H);
[B,L] = bwboundaries(F);
Region = regionprops(L,'Area','Centroid', 'Perimeter');
zdrowe4L=0; zdrowe4S=0;
for n = 1:length(B)

      perimeter = Region(n).Perimeter;       
      area = Region(n).Area;              
      wkoL = 2*(area/pi).^0.5;
      wkoS = (perimeter/pi);
      zdrowe4L=zdrowe4L + wkoL;
      zdrowe4S=zdrowe4S + wkoS;
end
%zdrowe5
[Z5]= imread('zdrowy5.png');
Z5=rgb2gray(Z5);
Z5=im2bw(Z5,0.4);
H=fspecial('disk', 8);
F=imfilter(Z5, H);
[B,L] = bwboundaries(F);
Region = regionprops(L,'Area','Centroid', 'Perimeter');
zdrowe5L=0; zdrowe5S=0;
for n = 1:length(B)

      perimeter = Region(n).Perimeter;       
      area = Region(n).Area;              
      wkoL = 2*(area/pi).^0.5; 
      wkoS = (perimeter/pi);
      zdrowe5L=zdrowe5L + wkoL;
      zdrowe5S=zdrowe5S + wkoS;
end

%identyfikowanie
im=rgb2gray(im);
im=im2bw(im,0.4);
axes(handles.processed_picture); %wyswietlenie wybranego zdjecia w GUI
imshow(im)
hold on
F=imfilter(im, H);  %stosuje filtr na moim obrazie
[B,L] = bwboundaries(F);
Region = regionprops(L,'Area','Centroid', 'Perimeter');
for n = 1:length(B)   %zaznaczam krawedzie na obrazku
boundary = B{n};   
plot(boundary(:,2), boundary(:,1), 'b', 'LineWidth', 2) 
end

X=0; Y=0;
for n = 1:length(B) % iteracja po obiektach

      perimeter = Region(n).Perimeter;       
      area = Region(n).Area;              
      wkoL = 2*(area/pi).^0.5;   % wspó³czynnik ko³owosci1
      wkoS = (perimeter/pi);     % wspolczynnik kolowosci2
      X=X + wkoL;
      Y=Y + wkoS;
end

SW = [rak1S; rak2S;rak3S; rak4S; rak5S; zdrowe1S; zdrowe2S; zdrowe3S; zdrowe4S; zdrowe5S]; %wzorzec wspolczynnika1
SL = [rak1L; rak2L;rak3L; rak4L; rak5L; zdrowe1L; zdrowe2L; zdrowe3L; zdrowe4L; zdrowe5L]; %wzorzec wspolczynnika2
group = ['rakowe'; 'rakowe';'rakowe'; 'rakowe'; 'rakowe'; 'zdrowe'; 'zdrowe'; 'zdrowe'; 'zdrowe'; 'zdrowe'];

%klasyfikacja
[C,err,P,logp,coeff] = classify([X Y],[SL SW], group,'linear');
set(handles.diagnosis, 'String', C); %wyswietlenie wyniku w GUI
