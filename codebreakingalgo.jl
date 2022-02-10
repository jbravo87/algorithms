# Start of file 'codebreakingalgo.jl'
#=
Created on Tuesday Feb 08 2022

Program to create target string, starting from
random string using genetic algorithm.

@author: José Bravo
=#
# Import necessary librarie(s)
using Random
#=
Need to set up parameters for code breaking. Start with ten digit code with digits
between 0 and 9. 
=#
codelength = 10
codeinfimum = 0
codesupremum = 9

# List of valid genes.
#=
Set up parameters for each generation including number of potential solutions to try, how many parents want to select from each
    population to breed from, and how many elite/chosen/favorable chromosomes will be passed through as children without (any) breeding.
=#
populationsize = 10
numparents = 5
favorablesize = 2

# Create secret passcode that will be cracked.
secretpasscode = []
for i in 1:codelength
    #println(codelength)
    push!(secretpasscode, rand(codeinfimum : codesupremum))
end
print(secretpasscode)

# Now to create initial population. Ten randomly generated passcodes of length ten digits.
population = []
for j in 1:populationsize
    chromosomes = []
    for k in 1:codelength
         push!(chromosomes, rand(codeinfimum:codesupremum))
    end
    push!(population, chromosomes)
end
print(population)