% Signal Processing and Systems
% Problem Set 6
% Ivan Chowdhury

clc;
clear;

% Problem 1
% 1c
A = [-1/5, 3/10; 1, 0];  % Declaring state space representation vectors
B = [1; 0];
C = [9/25, 14/25];
D = [1/5];

[b,a] = ss2tf (A, B, C, D)  % Converting state space representation to transfer function for digital filter

% 1d
AT = transpose (A);  % Transposing each of the state space representation vectors
BT = transpose (C);
CT = transpose (B);
DT = transpose (D);

[b2, a2] = ss2tf (AT, BT, CT, DT)  % Converting the transposed state space representations
comparisonB = isequal (b2, b)  % Testing equality between original and new transfer functions
comparisonA = isequal (a2, a)
% They are indeed equal. Transposing state space representations doesn't change the transfer functions

% 1e
[A3, B3, C3, D3] = tf2ss(b, a)  % Converting the transfer function to the original [state space] realization.

% 1f
T = [3, 7 ; 2, 5];  % Creating a new state space realization using the given matrix

A4 = T * A3 * inv (T);
B4 = T * B3;
C4 = C3 * inv (T);
D4 = D3;

[b4, a4] = ss2tf (A4, B4, C4, D4)  % Conversion to transfer function. Equivalent to original transfer function [b,a]

% 1g
lambdaA = eig (A);  % Computing the eigenvalues of each of the state space variants
lambdaAT = eig (AT);
lambdaA4 = eig (A4);
isequal (lambdaA, lambdaAT, lambdaA4)  % Testing equality
% They don't match exactly. All 3 have eigenvalues 0.4568 and -0.6568, but eig(T*A*inv(T)) has its elements switched.

[s, p, k] = tf2zp (b, a)  % Computing the poles and zeros of each variant.
[s2, p2, k2] = tf2zp (b2, a2)
[s4, p4, k4] = tf2zp (b4, a4)
% The poles of H all match.