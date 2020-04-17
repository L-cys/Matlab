% ���⣺��֤��һ�����ݷ���t�ֲ�ʱ�������ɶ� n -> inf��t�ֲ���������̬�ֲ�����ͼ
% ������׼��ÿ�����Ӧ��t�ֲ��ܶȺ�����ĵ��Ӧ����̬�ֲ��ܶȺ���֮���ƽ����
% α���룺
% �������һ�������̬�ֲ����������ٲ���һ����ӿ����ֲ����������������� n = 5,10,50,100
% for ��ͬn��ȡֵ
% ���Ƴ����� t = x / (y/n)^0.5 ��Ƶ���ֲ�ͼ
% ���ø������������λ��������׼��̬�ֲ��ĸ����ܶ�����
% �����ֵ
% ͬһ��ͼ�ϱ�������ͼ��
% endfor

%Matlab����ʵ��

figure
for n = [5,10,50,100];
    x = normrnd(0,1,[5000,1]);
    y = chi2rnd(n,[5000,1]);
    t = x./y;
    %�ѹ���t�ֲ�
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

