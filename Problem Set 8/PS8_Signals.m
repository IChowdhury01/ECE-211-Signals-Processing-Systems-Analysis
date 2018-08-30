% Signal Processing and Systems
% Problem Set 8
% Ivan Chowdhury

clc, clear;

% 2
b = [1 0.4 0.3];  % Declaring transfer function matrices
a = [1 -0.9 0.81];

figure  % Creating Zero-Pole plot
zplane (b, a)
%% 3
N = 10000;  % Declaring filter parameters
VAR = 3;
STD = sqrt (VAR);
v = STD .* randn (1, N);  

x = filter (b, a, v);  % Creating 1D digital filter
%% 4
m0 = 5;  
rx = zeros (1, 6);  % Preallocating array 

for i = 1:6  % Creating array values
  m = i-1;
  rx(i) = (1 / (N-m)) * (x(1:N-m) * x (i:N)');
end
%% 5
R = toeplitz (rx)  % Creating toeplitz matrix from array values
% Matrix has diagonal symmetry. This means that Rx(-m) = Rx(m):
%% 6
Eigenvalues = eig (R)  % Computing eigenvalues of matrix
% All eigenvalues are positive. This means that the associated correlation matrix is positive definite
%% 7
[s_est, w] = pwelch(x, hamming (512), 256, 512);
%% 8
H = freqz (b, a, w);  % Computing transfer function properties: Frequency response and normalized power spectral density (actual and estimated)
Sx = 3 * (abs (H) .^ 2);
Sx_normalized = Sx / mean (Sx);
s_est_normalized = s_est / mean (s_est);

figure ('Name', 'Estimated Spectrum and Actual PSD Sx(w) [Normalized]');  % Plotting Normalized Estimated and Actual Power Spectral Density vs Frequency
hold on;
plot (w, s_est_normalized, 'r-');
plot (w, Sx_normalized, 'b-');
hold off;

axis ([0 pi 0 11])  % Plot labels
title ('Estimated Spectrum vs Actual PSD Sx(w) [Normalized]');
xlabel ('Frequency (radians/sec)');
ylabel ('Power Spectral Density');
legend ('Normalized Estimate Spectrum','Normalized Actual PSD');
grid on

%% 9
[Max_PSD Index] = max (Sx);  % Computing peak frequency and Power Spectral Density
w_peak = w (Index)

[z, p, k] = tf2zp (b, a);  % Computing Zeroes, Poles, and Pole angles for comparison to peak frequency
angle (p)
% Pole angles are close to w_peak in magnitude.
%% 10
B = x (6:N);  % Creating matrices based on filter parameters, including associated toeplitz matrix
C = fliplr (x(1:6));
A = toeplitz (C, B); 
% Each column matrix A(:,1),...A(:,9995) has the same correlation matrix R

svd1 = svd (A);  % Computing singular value decomposition of the toeplitz matrix above.
svd2 = (svd1 .^ 2) / (N - 5);  % Modified svds for comparison
svd2 = sort (svd2), Eigenvalues = sort (Eigenvalues);
Comparison = abs (svd2 - Eigenvalues);
% Not exactly equal, but approximately so. Difference increases for larger elements.

[U, S, V] = svd (A); % Alternative singular value decompsition. A = U * S * V
% U contains the left singular vectors of A

v_check = (U * R) ./ R;
% Entries are roughly equal to one of the Eigenvalues of R, except for indexes where U approaches 0.
