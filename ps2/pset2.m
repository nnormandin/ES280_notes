% Problem 1
n = 457
n_red = 248
p_hat = n_red / n
P = 0.5
delta = 0

sigma = sqrt(((P*(1-P))/n))

Z = (p_hat - P) / sigma
p_one_sided = 1-normcdf(Z)
p_two_sided = 2*(1-normcdf(Z))

x = linspace(0.4, 0.6, 100)
mu = 0.5;
sigma = 0.0234;
y = normpdf(x,mu,sigma)
plot(x, y)
hold on
line([p_hat, p_hat], [0, 18])