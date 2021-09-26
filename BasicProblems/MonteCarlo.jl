function samplePoint()
    sampled_x = rand()
    sampled_y = rand()
    return (x=sampled_x, y=sampled_y)
end


function monteCarlo(nb_samples::Int64)
    pi_approx = 0
    for _ in 1:nb_samples
        point = samplePoint()
        x, y = point.x, point.y
        if (x^2 + y^2) <= 1
            pi_approx += 1
        end
    end

    return 4*pi_approx / (nb_samples)
end

approx_pi = monteCarlo(20000000)

error = abs(pi - approx_pi)

print("Pi approximation error: $error")