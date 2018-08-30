% Signal Processing and Systems
% Problem Set 4
% Ivan Chowdhury

clc;
clear;
load ellipfilthw.mat

% Question 6
% 6a
k = 1;  % Creating Poles and Zeroes matrices
z1 = .8*(3^(1/2)/2 + j*(1/2));
z2 = .8*(3^(1/2)/2 - j*(1/2));
z = [z1 z2]'  % Zeroes matrix
p1 = .9*(-(2^(-1/2))+j*(2^(-1/2)));
p2 = .9*(-(2^(-1/2))-j*(2^(-1/2)));
p = [p1 p2]'  % Poles matrix

[b,a] = zp2tf(z,p,k);  % Converting Zero-Pole form to rational transfer function for digital filter

% 6b
n1=51;
[h,n] = impz(b,a,n1);  % Computing impulse response of digital filter

figure  % Plotting Impulse Response via stem plot
stem(n,h)
title('Impulse Response h[n]');
xlabel('Discrete time (n)');
ylabel('h[n]');

% 6c
fs = 150;    %MHz%
n2 = linspace(0,fs/2,1000);
[h1,f1] = freqz(b,a,n2,fs); % Computing frequency response of digital filter

figure  % Plotting Magnitude Response and Phase Response of digital filter on the same figure
subplot(2,1,1); 
plot(f1,20*log10(abs(h1)))
grid on
title('Magnitude Response')
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')

subplot(2,1,2); 
plot(f1,rad2deg(angle(h1)))
grid on
title('Phase Response')
xlabel('Frequency (Hz)')
ylabel('Phase (Degrees)')