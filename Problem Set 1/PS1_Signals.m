% Signal Processing and Systems Analysis
% Problem Set 1
% Ivan Chowdhury

clc;
clear;

% Question 5
t = 0:0.1:1;  % Part 5d: Graph the 5th harmonic of a given signal x(t) alongside its approximation.
T = 1;
x_t = exp ((-2*pi*t)/T);  % Creating vectors for the independent variable (time from 0 to 1 second) and dependent variable (the signal x(t))

hold on  % Plotting vectors
plot(t, x_t, 'DisplayName', 'x(t)')
title('5th Harmonic X(t)');
xlabel('t (seconds)');
ylabel('x (t)');
grid on;

n = -5:5
x_approximate(1)=0;
x_approximate = x_approximate + (exp(1j * 2 * pi .* t .* n)) .* ((1 - exp(-2 * pi)) ./ (2 * pi * (1 + 1j .* n)));  % Creating a vector for the approximation of the signal x(t)

i_magnitude = max(imag(x_approximate))  % Computing the imaginary part of the signal. Approximately 0%
real_magnitude = real(x_approximate) % Computing the real part of the signal

plot(t, real_magnitude, 'DisplayName', 'Approximation');  % Plotting the real component of the signal approximation vs time (in seconds).
legend('show');
hold off
%% Question 6
n2 = -5:5;  % Part 6d: Plot the fourier coefficients of the 5th harmonic of the signal x(t)
T2 = 1;
C_n = (1 - exp(-2 * pi - 1j .* n .* T2)) .* (1 ./ (2 * pi + 1j .* n .* T2));  % Fourier coefficient formula

figure;  % Discrete stem plot of fourier coefficients
stem(n2, real(C_n));
title('Fourier Coefficients |Cn|');
xlabel('n');
grid on
