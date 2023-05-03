n1=-9;
n2=-7;
n3=-5;
n4=-4;
F1= 440*(2^(n1/12));
F2= 440*(2^(n2/12));
F3= 440*(2^(n3/12));
F4= 440*(2^(n4/12));
%QUESTION 1
Fs= 10* max([F1,F2,F3,F4]);
framesize= round(0.5*Fs);
T= 1/Fs;
t=(0:1:framesize-1)*T;
xt1=cos(2*pi*F1*t);
xt2=cos(2*pi*F2*t);
xt3=cos(2*pi*F3*t);
xt4=cos(2*pi*F4*t);
xt= [xt1 xt2 xt3 xt4];
framesize= framesize *4;
t=(0:1:framesize-1)*T;
%QUESTION2
filename= 'Xt.wav';
audiowrite('Xt.wav',xt, fix(Fs));
sound(xt,Fs);
%QUESTION3: Plot the Xt:
figure;
plot(t,xt);
xlabel('Time (seconds)');
title('Xt');
%QUESTION4
XEnergy= sum(abs(xt.^2))*T;
%QUESTION5
Xf= fftshift(fft(xt,framesize))*T;
dF = Fs/framesize;                      
f = -Fs/2:dF:Fs/2-dF;          
%Question6: Plot the Xf spectrum:
figure;
plot(f,abs(Xf)/framesize);
xlabel('Frequency (in hertz)');
title('Xf-Magnitude Response');
%QUESTION7
XEnergy2=sum(abs(Xf.^2))*dF;
%QUESTION8
Fc= (F2+F3)/2;
nF= Fc/(Fs/2);
[b,a] = butter(20,nF,"low");
%QUESTION9
figure;
freqz(b, a, framesize);
%QUESTION10
Y1t= filter(b,a,xt);
%QUESTION11
filename= 'Yt.wav';
audiowrite('Yt.wav',Y1t, fix(Fs));
sound(Y1t,Fs);
%QUESTION12
figure;
plot(t,Y1t);
xlabel('Time (seconds)');
title('Y1t');
%QUESTION13
Y1Energy= sum(abs(Y1t.^2))*T;
%QUESTION14
Y1f= fftshift(fft(Y1t,framesize))*T;
%QUESTION15
figure;
plot(f,abs(Y1f)/framesize);
xlabel('Frequency (in hertz)');
title('Y1f-Magnitude Response');
%QUESTION16
Y1Energy2=sum(abs(Y1f.^2))*dF;
%QUESTION17
[d,c] = butter(20,nF,"high");
%QUESTION18
figure;
freqz(d, c, framesize);
%QUESTION19
Y2t= filter(d,c,xt);
%QUESTION20
filename= 'Y2t.wav';
audiowrite('Y2t.wav',Y2t, fix(Fs));
sound(Y2t,Fs);
%QUESTION21
figure;
plot(t,Y2t);
xlabel('Time (seconds)');
title('Y2t');
%QUESTION22
Y2Energy= sum(abs(Y2t.^2))*T;
%QUESTION23
Y2f= fftshift(fft(Y2t,framesize))*T;
%QUESTION24
figure;
plot(f,abs(Y2f)/framesize);
xlabel('Frequency (in hertz)');
title('Y2f-Magnitude Response');
%QUESTION25
Y2Energy2=sum(abs(Y2f.^2))*dF;