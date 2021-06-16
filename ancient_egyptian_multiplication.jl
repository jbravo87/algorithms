n1 = 89
n2 = 18
# Will create two vectors.
# One handling halving and doubling
halving = [n1]
# Remember that Julia is 1-based indexing.
i = 1
while halving[i] > 1
    push!(halving, floor(halving[i] / 2))
    i += 1
end

j = 1
doubling = [n2]
while length(doubling) < length(halving)
    push!(doubling, doubling[j] * 2)
    j += 1
end

using DataFrames
# Will join the two tables created earlier.
half_double = hcat(halving, doubling)
# Used horizontal concatenating instead of DataFrame

# The following will give the location of the odd number in the data table.
findall(isodd, half_double)
findall(x -> x % 2 == 1, half_double)
