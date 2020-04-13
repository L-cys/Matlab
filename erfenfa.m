clear
clc

%¶þ·Ö·¨
eps = 1e-3;

f1 = @(x)(sin(x)- 6*x - 5);
a1 = -1; b1 = 0;

f2 = @(x)(log(x) + x^2 - 3);
a2 = 1; b2 = 2;

f3 = @(x)(exp(x) + x - 7);
a3 = 1; b3 = 2;


%f1
    if abs(f1(a1)) < eps
        ans1 = a1;
    elseif abs(f1(b1)) < eps
        ans1 = b1;
    else
        while(1)
            x = (a1 + b1)/2;
            if abs(f1(x)) < eps
                ans1 = x;
                break;
            end
            if f1(a1)*f1(x) < 0
                b1 = x;
            else a1 = x;
            end
        end
    end

disp(ans1);

%f2
if abs(f2(a2)) < eps
        ans2 = a2;
    elseif abs(f2(b2)) < eps
        ans2 = b2;
    else
        while(1)
            x = (a2 + b2)/2;
            if abs(f2(x)) < eps
                ans2 = x;
                break;
            end
            if f2(a2)*f2(x) < 0
                b2 = x;
            else a2 = x;
            end
        end
    end
disp(ans2);

%f3
if abs(f3(a3)) < eps
        ans3 = a3;
    elseif abs(f3(b3)) < eps
        ans3 = b3;
    else
        while(1)
            x = (a3 + b3)/2;
            if abs(f3(x)) < eps
                ans3 = x;
                break;
            end
            if f3(a3)*f3(x) < 0
                b3 = x;
            else a3 = x;
            end
        end
    end
disp(ans3);
