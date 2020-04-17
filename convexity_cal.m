%Convexity calculator
function convexity_cal = convexity_cal(year_to_maturity,coupon_rate,ytm,times,par,price)
    n = year_to_maturity * times;
    sum = 0;
    coupon_rate = coupon_rate / times;
    ytm = ytm / times;
    coupon = coupon_rate * par;
    for i = 1:n
        sum = sum + (i * (i+1) * coupon) / (1+ytm)^(i+2);
    end
    sum = sum + (n * (n+1) * par) / (1+ytm)^(2+n);
    sum = sum/price;
    convexity_cal = sum/times^2;