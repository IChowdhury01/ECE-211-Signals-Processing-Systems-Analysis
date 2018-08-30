% Signal Processing and Systems
% Problem Set 4
% Ivan Chowdhury

clc;
clear;
load ellipfilthw.mat

% Question 5: Extract data about analog and digital filters given parameters in ellipfilthw.m
% 5a - Analog Filter
fprintf('Analog Filter Order: %g\n',2*n);  % Order of analog filter

zplane(z,p)  % Pole-Zero plot of analog filter
grid

magnitude = abs(H);  % Magnitude and Phase of analog filter
phase = 180/pi.*angle(H);

subplot(2,1,1)  % Using subplot to plot multiple graphs on the same figure
semilogy(f,magnitude)  % Semilogarithmic scale (Y-axis) 
grid on
xlabel('Frequency (Hz)')
ylabel ('Magnitude (dB)')  % Plotting Magnitude vs Frequency

x = [0 20000];
y = [20*log10(-rs) 20*log10(-rs)];
line(x,y,'LineStyle','--');
y = [20*log10(abs(-rp)) 20*log10(abs(-rp))];
line(x,y,'LineStyle','--');
y = [log(0) log(0)];
line(x,y,'LineStyle','--');

subplot(2,1,2)
plot(f,phase)
grid on
xlabel('Frequency (Hz)')
ylabel('Phase (Degrees)')  % Plotting Phase vs Frequency


%% 5b - Digital Filter
fprintf('Digital Filter Order: %g\n',2*nd);  % Order of digital filter

zplane(zd,pd)  % Pole-Zero plot of digital filter
grid

magnitude2 = abs(Hd);  % Magnitude and Phase of digital filter
phase2 = 180/pi.*angle(Hd);

subplot(2,1,1)  % Plotting Magnitude vs Frequency for the digital filter
semilogy(f,magnitude2)
grid on
xlabel('Frequency (Hz)')
ylabel('Magnitude')

x_b = [0 20000];
y_b = [20*log10(-rs) 20*log10(-rs)];

line(x,y,'LineStyle','--');
y_b = [20*log10(-rp) 20*log10(-rp)];
line(x,y,'LineStyle','--');
y_b = [1 1];
line(x,y,'LineStyle','--');

subplot(2,1,2), plot(f,phase), grid on  % Plotting Phase vs Frequency for the digital filter
xlabel('Frequency (Hz)')
ylabel('Phase (degrees)')
