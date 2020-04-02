data = xlsread('/Users/chenyuanshan/Downloads/shangzheng.xlsx');
rt = (data-mean(data))/std(data);
%figure of bar
figure
[CdfF,CdfX] = ecdf(rt,'Function','cdf');  % compute empirical cdf
BinInfo.rule = 1;
[~,BinEdge] = internal.stats.histbins(rt,[],[],BinInfo,CdfF,CdfX);
[BinHeight,BinCenter] = ecdfhist(CdfF,CdfX,'edges',BinEdge);
hLine = bar(BinCenter,BinHeight,'hist');

% normal distribution.
yy = normpdf(BinCenter,0,1);
er = sum((BinHeight - yy).^2);
load carsmall
h = jbtest(rt)
hold on
plot(BinCenter,yy)
k = kurtosis(rt)
s = skewness(rt)

%stable distribution.
sd = stblfit(rt);
ysd = stblpdf(BinCenter,sd(0),sd(1),sd(2),sd(3))
hold on
plot(BinCenter,ysd)
err = sum((BinHeight - ysd).^2)

%Cauchy distribution.
cdd = stblpdf(BinCenter,1,0,sd(2),sd(3));
hold on
plot(BinCenter,cdd)
er1 = sum((BinHeight - cdd).^2)

%mixed normal distribution, we have to use the original data.
[CdfF,CdfX] = ecdf(data,'Function','cdf');
BinInfo.rule = 1;
[~,BinEdge] = internal.stats.histbins(data,[],[],BinInfo,CdfF,CdfX);
[BinHeight,BinCenter] = ecdfhist(CdfF,CdfX,'edges',BinEdge);
hLine = bar(BinCenter,BinHeight,'hist');
>> my = normpdf(BinCenter,0.000254216,0.012252074);
>> hold on
plot(BinCenter,my)
>> mer = sum((BinHeight - my).^2)


