#=
Created on Sunday Jan 23 2022

Algorithm to create a continued fraction representation
as well as decimal representation.

@author: José Bravo
=#

println(max(3, 1))
println(min(9, 23232))
x = 105
y = 33
big = max(x, y)
println(big)
small = min(x, y)
println(small)
output = []
x2 = floor(big/small)
quotient = floor(big/small)
println("the data type of the floor function: ", typeof(quotient))
push!(output, quotient)
println(output)
println(typeof(output))
println("6 mod 3 is ", 6 % 3)
println("7 mod 4 is ", 7 % 4)
println("98 mod 12 is ", 98 % 12)
new_small = big % small
println(new_small)
big = small
small = new_small
output
length(output)
some_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
length(some_array)
function continued_fraction(x, y, length_tolerance)
    output = []
    big = max(x, y)
    small = min(x, y)
    while small > 0 && length(output) < length_tolerance
        quotient = floor(big/small)
        push!(output, quotient)
        new_small = big % small
        big = small
        small = new_small
    end
    return output
end

continued_fraction(105, 33, 10)
print(continued_fraction(105, 33, 10))