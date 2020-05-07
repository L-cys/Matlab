% Predict
%% Use original data to predict 100 steps.
a = [0.0002;-0.0283;0.0169;-0.0108;-0.0337]
X = 100;
rt = sh(length(sh)-3:length(sh),:);
z = zeros(X+4,1);
z(1) = rt(1);
z(2) = rt(2);
z(3) = rt(3);
z(4) = rt(4);
for i = 5: (X + 3)
    z(i) = a(1) + a(2) * z(i-1) + a(3) * z(i-2) + a(4) * z(i-3) + a(5) * z(i-4);
end
figure(1)
plot(z(5:X+3))
original_avg = mean(sh);

%% Contact original part and predict part.
before = [5500:length(sh)];
before_data = sh(5500:length(sh),:);
before = before';
after = [(length(sh)+1):(length(sh)++length(z))];
after = after';
figure(2)
plot(before,before_data,'b',after,z,'r')

%% Check whether it is correct.
% Use Distribution Fitter draw histagram of two data sets. 
