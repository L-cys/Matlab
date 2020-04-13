%jaccobi

clear
clc
eps = 1e-3;

A2 = zeros(100,100);
B2 = zeros(100,1);
B2(1)=2;
B2(100) = 2;
for nn=2:99
    B2(nn) = 1;
end
for nn=2:99
    A2(nn,nn)=3;
    A2(nn,nn-1)= -1;
    A2(nn,nn+1)= -1;
end
A2(1,1)= 3; A2(1,2) = -1;
A2(100,100) = 3; A2(100,99) = -1; 
n2 = 100;

x0 = zeros(n2,1);
for t=1:100
    x0(t) = 1;
end
for count = 1:30
    for i = 1:n2
        sum = 0;
        for j = 1:n2
            if j == i
                continue;
            else 
                sum = sum + A2(i,j) * x0(j,1);   
            end
        end
        x(i,1) = (-1)/A2(i,i) * (sum - B2(i,1));
    end
    x0 = x;
end
disp(x0);