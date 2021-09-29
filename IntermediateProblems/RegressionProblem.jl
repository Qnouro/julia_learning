using Plots

N = 1000
dim = 2

X = randn(N, dim)
a0 = rand(dim)
y = X * a0 + 0.1 * randn(N)

# Creating our data matrix
matrix = hcat(ones(N), X)

# Solving for Mx = y
result = matrix \ y
result

plotlyjs()
plot()
scatter!(X, y)
# to use the fucking undocumented abline! function, you give the slope first!!
Plots.abline!(result[2], result[1])
Plots.abline!(result[3], result[1])