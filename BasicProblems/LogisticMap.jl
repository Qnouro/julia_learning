using Plots

T = 1000

r_list = LinRange(2,4.0, 2001) 
all_results = []


for r in r_list
    local bn = 0.25
    local results = []
    for i in 1:(T - 1)
        bn = r * bn * (1 - bn)
    end

    for i = 1:150
        bn = r * bn * (1 - bn)
        push!(results, bn)
    end
    push!(all_results, results)
end

gr()
plot(r_list, transpose(hcat(all_results...)), seriestype=:scatter, markersize=1, legend=false)

savefig("plot.png")
