%% Create a series of data with parcorrelation equals to 4.
data = xlsread("/Users/chenyuanshan/Downloads/shangzheng.xlsx");

figure(1)
plot(data)
T = length(data);

%% Draw the figure of par
figure(2)
parcorr(data)

%% FI model
e_if = zeros(1,20);
[i,e_if(1)] = aryule(data,1);
min = log10(e_if(1));
p = 1;
for l = 2:20
    [i,e_if(l)] = aryule(data,l);
    ii = log10(e_if(l));
    if ii < min
        min = ii;
        p = l;
    end
end
disp(min);
disp(p);

[i,e_IF] = aryule(data,p);
disp(i)


%% AIC model
e_aic = zeros(1,20);
[a,e_aic(1)] = aryule(data,1);
min = log(e_aic(1)) + 2 * (1 + 1) / T;
p = 1;
for l = 2:20
    [a,e_aic(l)] = aryule(data,l);
    aic = log(e_aic(l)) + 2 * (l + 1) / T;
    if aic < min
        min = aic;
        p = l;
    end
end
disp(min);
disp(p);

[a,e_AIC] = aryule(data,p);
disp(a)

%% BIC model
e_bic = zeros(1,20);
[b,e_bic(1)] = aryule(data,1);
min = log(e_bic(1)) + (1 + 1) * log(T) / T;
p = 1;
for l = 2:20
    [b,e_bic(l)] = aryule(data,l);
    bic = log(e_bic(l)) + (l + 1) * log(T) / T;
    if bic < min
        min = bic;
        p = l;
    end
end
disp(min);
disp(p);

[b,e_BIC] = aryule(data,p);
disp(b)
