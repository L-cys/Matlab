shangzheng = xlsread('/Users/chenyuanshan/Downloads/shangzheng.xlsx');

rt = zeros(length(shangzheng)-4,1);
rt_1 = zeros(length(shangzheng)-4,1);
rt_2 = zeros(length(shangzheng)-4,1);
rt_3 = zeros(length(shangzheng)-4,1);
rt_4 = zeros(length(shangzheng)-4,1);

for i = 1:(length(shangzheng)-4)
    rt(i) = shangzheng(i);
    rt_1(i) = shangzheng(i+1);
    rt_2(i) = shangzheng(i+2);
    rt_3(i) = shangzheng(i+3);
    rt_4(i) = shangzheng(i+4);
end

%% p = 1
x1 = [ones(length(rt'),1),rt_1];
[b1,bint1,r1,rint1,status1] = regress(rt,x1);

%% p = 2
x2 = [ones(length(rt'),1),rt_1,rt_2];
[b2,bint2,r2,rint2,status2] = regress(rt,x2);

%% p = 3
x3 = [ones(length(rt'),1),rt_1,rt_2,rt_3];
[b3,bint3,r3,rint3,status3] = regress(rt,x3);

%% p = 4
x4 = [ones(length(rt'),1),rt_1,rt_2,rt_3,rt_4];
[b4,bint4,r4,rint4,status4] = regress(rt,x4);