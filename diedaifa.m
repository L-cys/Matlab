clear;
clc;

eps = 1e-3;

x1 = @(x)((sin(x)-5)/6);
a1 = 1;

x2 = @(x)((3 - log(x))^0.5);
a2 = 1.6;

x3 = @(x)(log(7-x));
a3 = 1.7;

%x1
y = a1;
a1 = x1(a1);
if abs(x1(a1)) < eps
    ans1 = a1;
else
    while abs(x1(a1)) > eps && abs(y - a1) > eps
        y = a1;
        a1 = x1(a1);
    end
    ans1 = a1;
end
disp(ans1);

%x2
y = a2;
a2 = x2(a2);
if abs(x2(a2)) < eps
    ans2 = a2;
else
    while abs(x2(a2)) > eps && abs(y - a2) > eps
        y = a2;
        a2 = x2(a2);
    end
    ans2 = a2;
end
disp(ans2);

%x3
y = a3;
a3 = x3(a3);
if abs(x3(a3)) < eps
    ans3 = a3;
else
    while abs(x3(a3)) > eps && abs(y - a3) > eps
        y = a3;
        a3 = x3(a3);
    end
    ans3 = a3;
end
disp(ans3);