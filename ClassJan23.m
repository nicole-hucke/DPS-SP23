%%%%% Class Jan 23 %%%%%%
load('whistle.mat')
whos 

plot(Y) 
t = ((1:length(Y))/Fs);
max(t)

close all
plot(t,Y)
%sound(Y,Fs)

Ydec = Y(1:12:end);
Fdec = round(Fs/12);
plot(Ydec)
sound(Ydec,Fdec)

%when we do it by hand it's really bad. We will decimate it with the built
%in function

Ydec2 = decimate(Y,12);
whos Ydec Ydec2

plot(Ydec)
hold on
plot(Ydec2)

sound(Ydec2,Fdec)
