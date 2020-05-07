sh = xlsread('/Users/chenyuanshan/Downloads/shangzheng.xlsx');
sz = xlsread('/Users/chenyuanshan/Downloads/ÉîÛÚ³ÉÖ¸.xlsx');
sz = sz(:,3);
figure(1)
plot(sh)
figure(2)
plot(sz)

figure(3)
parcorr(sh)
figure(4)
parcorr(sz)

