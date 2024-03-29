n_votes = 23

% p-value in right tail
2*(1 - binocdf(n_votes-1, 32, 0.5))


% p-value in left tail
2* binocdf(n_votes, 32, 0.5)


old_mileage = 25.0
new_mileage = 25.7
n_test = 30
std_test = 2.4
sigma_test = std_test / sqrt(n_test)


p_value = 1- normcdf(new_mileage, old_mileage, sigma_test)


%%%%%%%%%%%%%%%%%
% t-test        %
%%%%%%%%%%%%%%%%%

x_bar = 0.66
mu = 0.618
n_t = 20
sample_std = 0.093
sigma_test = sample_std / sqrt(n_t)
t0 = (x_bar - mu) / sigma_test

% p-value
p_value = 2*(1-tcdf(t0, n_t-1))

% X-crit (two sided)
alpha = 0.05
t0_right = tinv(1-(alpha/2), n_t-1)
t0_left = tinv(alpha/2, n_t-1)

reject_right = (t0_right*sigma_test)+mu
reject_left = (t0_left*sigma_test)+mu


%%%%%%%%%%%%%%%%
% normal/bin   %
%%%%%%%%%%%%%%%%

alpha = 0.1
n_t = 91
n_success = 16
p_hat = n_success / n_t

p = 0.15
sigma = sqrt(((p*(1-p))/n_t))

Z = (p_hat -p) / sigma
1-normcdf(Z)
norminv(0.9)


%%%%%%%%%%%%%%%
% two sample  %
%%%%%%%%%%%%%%%

x1 = .2319
x2 = .2097
s1 = .0145
s2 = .00977
n1 = 8
n2 = 10
delta = 0
alpha = 0.01
sp2 = ((n1-1)*s1^2 + (n2-1)*s2^2) / (n1+n2-2)
T = (x1-x2-delta)/(sqrt(sp2)*sqrt(1/n1 + 1/n2))
2*(1-tcdf(T, n1+n2-2))




data1 = csvread('ABdata1.csv')
data2 = csvread('ABdata2.csv')

[h,p,ci,stats] = ttest2(data1, data2, 'vartype', 'unequal')
        
x1 = 30.11
x2 = 31.13
s1 = 10.9
s2 = 11.24
n1 = 995
n2 = 1000

v_num = ((s1^2/n1 + s2^2/n2)^2)
v_denom = ((s1^2 / n1)^2)/(n1-1) + ((s2^2 / n2)^2)/(n2-1)
v = v_num / v_denom

T = (x1-x2) / sqrt(((s1^2)/n1) + ((s2^2)/n2))
tcdf(T, v)

