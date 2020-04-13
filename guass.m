%Gauss
A1 = [2,-2,-1;4,1,-2;-2,1,-1];
B1 = [-2;1;-3];
n = 3;
ans = zeros(3,1);

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


%A1
for k=1:n-1 %k行
    for i = k+1 : n %第k行以后的i行的k+1位要除k行的主元素
        mik = A1(i,k)/A1(k,k);
        for j = k+1 : n %修改i行k位置后每个数的值，以及最后的b矩阵
            A1(i,j) = A1(i,j)-mik*A1(k,j);
        end
        B1(i) = B1(i) - mik*B1(k);%修改i行对应的b位置，此时应该得到一个上三角阵
    end
end
%回代
ans(n) = B1(n)/A1(n,n);
for i = n-1 :-1: 1
    sum = 0;
    for j = i+1 : n
        sum = sum + A1(i,j) * ans(j);
    end
    ans(i) = (B1(i) - sum)/A1(i,i);
end
disp(ans);

%A2
for k=1:n2-1 %k行
    for i = k+1 : n2 %第k行以后的i行的k+1位要除k行的主元素
        mik = A2(i,k)/A2(k,k);
        for j = k+1 : n2 %修改i行k位置后每个数的值，以及最后的b矩阵
            A2(i,j) = A2(i,j)-mik*A2(k,j);
        end
        B2(i) = B2(i) - mik*B2(k);%修改i行对应的b位置，此时应该得到一个上三角阵
    end
end
%回代
ans2(n2) = B2(n2)/A2(n2,n2);
for i = n2-1 :-1: 1
    sum = 0;
    for j = i+1 : n2
        sum = sum + A2(i,j) * ans2(j);
    end
    ans2(i) = (B2(i) - sum)/A2(i,i);
end
disp(ans2);