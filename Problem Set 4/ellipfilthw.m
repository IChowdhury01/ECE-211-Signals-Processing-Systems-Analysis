% ellipfilthw:  Elliptic Filter Design Homework Problem
% ECE211 Signal Processing
% Cooper Union  EE Dept.   Spring 2018   Prof. Fred L. Fontaine
%

% specs:
% Bandpass filter with passband 10kHz<f<12kHz, ripple 2dB
% Stopband f<9.8kHz and f>12.2kHz, attenuation 30dB
% Compare analog and digital elliptic filters (dig. samp. rate 40kHz)

%specs
fp= [10e3,12e3]; fs= [9.8e3,12.2e3];
fsamp= 40e3; fNyq= fsamp/2;
rp=2; rs=30;
f= linspace(0,fNyq,1000);

%analog filter design
[n,wn]= ellipord(2*pi*fp,2*pi*fs,rp,rs,'s');
[z,p,k]= ellip(n,rp,rs,wn,'s');
[b,a]= zp2tf(z,p,k);
H= freqs(b,a,2*pi*f);   % takes frequency in rad/sec
% Note: filter order is 2*n (n= # second order sections)

% digital filter design
fpd= fp/fNyq; fsd= fs/fNyq;  %ellipord takes dig freq norm to Nyq BW
[nd,wnd]= ellipord(fpd,fsd,rp,rs);
[zd,pd,kd]= ellip(nd,rp,rs,wnd);
[bd,ad]= zp2tf(zd,pd,kd);
Hd= freqz(bd,ad,f,fsamp);  % takes f in Hz, fsamp= samp rate
% Note: filter order is 2*nd (nd= # second order sections)
