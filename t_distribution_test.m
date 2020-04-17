% 问题：验证当一组数据服从t分布时，令自由度 n -> inf，t分布趋向于正态分布并作图
% 趋紧标准：每个点对应的t分布密度函数与改点对应的正态分布密度函数之间的平方差
% 伪代码：
% 随机产生一组服从正态分布的样本，再产生一组服从卡方分布的样本，本次试验 n = 5,10,50,100
% for 不同n的取值
% 绘制出样本 t = x / (y/n)^0.5 的频数分布图
% 利用各样本点的中心位置作出标准正态分布的概率密度曲线
% 计算差值
% 同一幅图上保留曲线图像
% endfor

%Matlab代码实现

figure
for n = [5,10,50,100];
    x = normrnd(0,1,[5000,1]);
    y = chi2rnd(n,[5000,1]);
    t = x./y;
    %已构造t分布
    [counts,centers] = hist(t,100);
    hold on
    plot(centers,counts/sum(counts));
    yy = normpdf(centers,0,1);
    er = sum((counts/sum(counts)-yy).^2)/sum(counts);
    disp(er);
    if n == 100
        hold on
        plot(centers,yy);
    end
end

