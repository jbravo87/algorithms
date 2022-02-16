#=
Variation of the Genetic Algorithm (GA).
WIll use to guess some arbitrary number.
=#
using Random
# Need a number to guess
correct_number = 55
# Function to calculate difference between any two integers.
function delta(value, some_number)
    some_number - value
end
# Test scenario
print(delta(15, 65))
# Generate numbers between -0.5 to 0.5.
# This will serve as population for GA
rand(500) .- 0.5
abs(delta(58, 23))
