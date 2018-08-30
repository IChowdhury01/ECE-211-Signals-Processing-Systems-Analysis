% Signal Processing and Systems
% Problem Set 7
% Ivan Chowdhury

clc, clear;

% Problem 5
% 5d
num1 = [1 2];  % Creating matrices
num2 = [-1 2];
den = [1 4.8 4];

% transfer function objects
s1 = tf (num1, den)
s2 = tf (num2, den)

% unit step responses
[y1, t1] = step (s1);
[y2, t2] = step (s2);

% graphs
hold on
plot (t1, y1);
plot (t2, y2);

legend ('H1(s)', 'H2(s)');
hold off