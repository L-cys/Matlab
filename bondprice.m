%bond price calculator
function bondprice=bondprice(year_to_maturity,coupon_rate,ytm,times,par)
    n = year_to_maturity * times;
    sum = 0;
    coupon_rate = coupon_rate / times;
    ytm = ytm / times;
    coupon = coupon_rate * par;
    for i=1:n
        sum = sum + coupon/(1+ytm)^i;
    end
    sum = sum + par/(1+ytm)^n;
    bondprice = sum;