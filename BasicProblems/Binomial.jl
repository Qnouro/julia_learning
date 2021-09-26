function probability(p)
    random_value = rand()
    if random_value < p
        return false
    else
        return true
    end
end

function binom(n, p)
    result = 0
    for i in 1:n
        if probability(p)
            result += 1
        end
    end
    return result
end


function sample_binom(nb_samples=200, n=10, p=0.5)
    results_list = Array{Int16}(undef, nb_samples)
    for i in 1:nb_samples
        results_list[i] = binom(n, p)
    end

    mean = 0
    for sample in results_list
        mean += sample
    end

    return mean/nb_samples
end



sample_binom(20000, 10, 0.5)

