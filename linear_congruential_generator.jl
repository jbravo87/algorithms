#=
A linear congruential generator (LCR) algorithm
=#

function next_random(previous, n1, n2, n3)
    next = (previous * n1 + n2) % n3
    return next
end

# Above is deterministic. Same input results in same output.

