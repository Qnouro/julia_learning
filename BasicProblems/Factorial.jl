function factorial_n(n)
    """
    Only accepts positive integers.
    """
    x = one(n)
    if (n == 1) | (n == 0)
        return 1
    end
    return x * n * factorial_n(n-1)
end

x = factorial_n(Int64(99))
println(typeof(x))
x