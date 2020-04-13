clear
clc

%Å£¶Ù·¨
eps = 1e-3;

f1 = @(x)(sin(x)- 6*x - 5);
f11 = @(x)(cos(x)-6);
a1 = 1;

f2 = @(x)(log(x) + x^2 - 3);
f22 = @(x)(1/x + 2*x);
a2 = 1.6;

f3 = @(x)(exp(x) + x - 7);
f33 = @(x)(exp(x) + 1);
a3 = 1.7;

%f1
x1 = a1;
while abs(f1(x1)) > eps
    x1 = x1 - f1(x1)/f11(x1);
end
disp(x1);

%f2
x2 = a2;
while abs(f2(x2)) > eps
    x2 = x2 - f2(x2)/f22(x2);
end
disp(x2);

%f3
x3 = a3;
while abs(f3(x3)) > eps
    x3 = x3 - f3(x3)/f33(x3);
end
disp(x3);
