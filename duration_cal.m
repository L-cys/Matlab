%Duration calculator

function duration_cal = duration_cal(year_to_maturity,coupon_rate,ytm,times,par,price)
    n = year_to_maturity * times;
    sum = 0;
    coupon_rate = coupon_rate / times;
    ytm = ytm / times;
    coupon = coupon_rate * par;
    for i = 1:n
        sum = sum + (i * coupon) / (1+ytm)^i;
    end
    sum = sum + (n * par) / (1+ytm)^n;
    sum = sum/price;
    duration_cal = sum/times;