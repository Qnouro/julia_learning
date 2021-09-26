using LinearAlgebra

N = 5

sub = Array{Int32, 1}(undef, N-1)
mid = Array{Int32, 1}(undef, N)
top = Array{Int32, 1}(undef, N-1)

sub .= 1
mid .= -2
top .= 1

A = Tridiagonal(
                sub,
                mid,
                top
                )
A

