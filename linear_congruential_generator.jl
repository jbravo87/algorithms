#=
A linear congruential generator (LCR) algorithm
=#

# Necessary libraries
using Plots

function next_random(previous, n1, n2, n3)
    next = (previous * n1 + n2) % n3
    return next
end

# Above is deterministic. Same input results in same output.
# Want to create a whole list by calling previousss function repeatedly.
# Want to notice any patterns

function list_randoms(n1, n2, n3)
    output = [1]
    while length(output) <= n3
        push!(output, next_random(output[length(output)], n1, n2, n3))
    end
    return output # NB return statement has to be outside the while loop.
end

#print(list_randoms(1, 2, 24))
# Period is 12 for the array above.

#print(list_randoms(1, 18, 36))

print(list_randoms(1, 1, 37))

function overlapping_sums_test(some_list, sum_length)
    list_length = length(some_list)
    append!(some_list, some_list) # Recall flow of logic. This must be in the correct slot.
    output = []
    for k in 1:list_length
        push!(output, sum(some_list[k:(k + sum_length)]))
    end
    
    return output

    
end

overlap = overlapping_sums_test(list_randoms(211111, 111112, 300007), 12)

histogram(overlap, color=:green, legend = false)
title!("Overlapping Sums Test")
xlabel!("sum of elements of overlapping consecutive list sections")
ylabel!("sum frequency")