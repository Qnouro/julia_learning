using Plots

function samplePoint()
    sampled_x = 2*rand() - 1
    sampled_y = 2*rand() - 1
    return (x=sampled_x, y=sampled_y)
end


function monteCarlo(nb_samples::Int64)
    pi_approx = 0
    x_inside_list = Float16[]
    y_inside_list = Float16[]
    x_outside_list = Float16[]
    y_outside_list = Float16[]

    for _ in 1:nb_samples
        point = samplePoint()
        x, y = point.x, point.y

        if (x^2 + y^2) <= 1
            pi_approx += 1
            push!(x_inside_list, x)
            push!(y_inside_list, y)
        else
            push!(x_outside_list, x)
            push!(y_outside_list, y)
        end
    end

    x_list = [x_inside_list, x_outside_list]
    y_list = [y_inside_list, y_outside_list]
    return [4*pi_approx / (nb_samples), x_list, y_list]
end

function main()
    approx_pi, x_list, y_list = monteCarlo(2000)

    error = abs(pi - approx_pi)
    
    print("Pi approximation error: $error")
    
    # plotting 
    # gr()  # Fast Graphical backend
    plotlyjs()  # Good old interactive plotly 
    
    scatter(
        x_list,
        y_list,
        seriestype= :scatter,
        title="Monte Carlo plot representation",
        xlabel="X",
        ylabel="Y",
        aspect_ratio=:equal  # equally scaled axis
        )
end

main()

