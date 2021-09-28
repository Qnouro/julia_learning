struct MyRange
    start::Float64
    step::Float64
    stop::Float64
end


function Base.getindex(a::MyRange, i::Int64)
    value = a.start + ((i - 1) * a.step) 
    if (value > a.stop) || (i < 1)
        throw(BoundsError(a, i))
    end

    return value
end


a = MyRange(0, 1, 5)

println(a[5])