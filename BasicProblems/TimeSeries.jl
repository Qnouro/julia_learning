using Plots

T = 200

alpha_list = [0, 0.5, 0.9]

formula(x::Float32, alpha::Float32)::Float32 = alpha * x + randn()


all_time_series = []
for alpha in alpha_list
    local x_t = Float32(0)
    local time_serie = [x_t]
    for t in 2:T
        x_t = formula(x_t, alpha)
        push!(time_serie, x_t)
    end
    push!(all_time_series, time_serie)
end

plotlyjs()
plot(
     1:T,
     all_time_series,
     title="Time series evolution depending on alpha",
     xlabel="time",
     ylabel="value",
     labels=["alpha=0.0" "alpha=0.5" "alpha=0.9"]
     )
