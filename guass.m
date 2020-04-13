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
for k=1:n-1 %k��
    for i = k+1 : n %��k���Ժ��i�е�k+1λҪ��k�е���Ԫ��
        mik = A1(i,k)/A1(k,k);
        for j = k+1 : n %�޸�i��kλ�ú�ÿ������ֵ���Լ�����b����
            A1(i,j) = A1(i,j)-mik*A1(k,j);
        end
        B1(i) = B1(i) - mik*B1(k);%�޸�i�ж�Ӧ��bλ�ã���ʱӦ�õõ�һ����������
    end
end
%�ش�
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
for k=1:n2-1 %k��
    for i = k+1 : n2 %��k���Ժ��i�е�k+1λҪ��k�е���Ԫ��
        mik = A2(i,k)/A2(k,k);
        for j = k+1 : n2 %�޸�i��kλ�ú�ÿ������ֵ���Լ�����b����
            A2(i,j) = A2(i,j)-mik*A2(k,j);
        end
        B2(i) = B2(i) - mik*B2(k);%�޸�i�ж�Ӧ��bλ�ã���ʱӦ�õõ�һ����������
    end
end
%�ش�
ans2(n2) = B2(n2)/A2(n2,n2);
for i = n2-1 :-1: 1
    sum = 0;
    for j = i+1 : n2
        sum = sum + A2(i,j) * ans2(j);
    end
    ans2(i) = (B2(i) - sum)/A2(i,i);
end
disp(ans2);