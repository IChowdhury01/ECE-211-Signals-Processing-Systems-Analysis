%Signals Problem Set #2
%Part 4(d)

h = [2,-1,2,3,-1];
x = [-2,4,1,1];
y = conv(h,x);

dSketch = stem(-3:4,y)