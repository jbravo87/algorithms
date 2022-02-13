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
global population = []
for j in 1:populationsize
    global chromosomes = []
    for k in 1:codelength
         push!(chromosomes, rand(codeinfimum:codesupremum))
    end
    push!(population, chromosomes)
end
print(population)
#=
Need to set-up function for the various evolutionary stages including:
1. Fitness Scoring
2. Selecting parents
3. Breeding to create new children
4. Mutation
=#
# Fitness Scoring
function fitness(population)
    global fitnessscores = []
    for chromosome in population
        matches = 0
        for index in 1:codelength
            if secretpasscode[index] == chromosome[index]
                matches += 1
            end
        end
        result = [chromosome, matches]
        push!(fitnessscores, result)
    end
    return fitnessscores
end

#Selecting Parents
function selectparents(fitnessscores)
    global parentslist = []
    sortedlist = sort(fitnessscores, by = x -> x[2], rev=true)
    for chromosome in sortedlist
        push!(parentslist, chromosome[1])
    end
    return parentslist
end
#=
Breeding to create new Children.
1st function is breeding logic. Two parents have randomly selected start and end cut point position.
Positions are used to combine the Genes of two parents to create new Child.
Second function used to select parents who make it to breeding to create enough children for a new
population. Elitism/favorable incorporated here.
=#
# First, breeding logic
function breed(parent1, parent2)
    child = []
    parent1 = parents[1]
    parent2 = parents[2]
    genea = Int(round(rand()*codelength))
    geneb = Int(round(rand()*codelength))
    startgene = min(genea, geneb)
    endgene = max(genea, geneb)
    for i in 1:codelength
        if i < startgene || i > endgene
            push!(child, parent1[i])
        else
            push!(child, parent2[i])
        end
    end
    return child
end

# Breeding and elitism/favorable
function createchildren(parentspool)
    children = []
    numberofnewchildren = length(population) - favorablesize
    for x in 1:favorablesize
        push!(children, parentspool[x])
    end
    for y in 1:numberofnewchildren
        parent1 = parentspool[Int(round(rand()*length(parentspool)))]
        parent2 = parentspool[Int(round(rand()*length(parentspool)))]
    end
    return children
end

#=
Finally the Mutation round.
Function runs through all children and i out of 10 will swap one gene for a random new gene.
=#

function mutation(children_set)
    for i in 1:length(children_set)
        if rand() > 0.1
            continue
        else
            mutated_position = Int(round(rand()*codelength))
            mutation = Int(round(codesupremum*(1-rand())))
            children_set[i][mutated_position] = mutation
        end
    end
    return children_set
end

# The functions are all set in place. Create while loop to run through until solution found.
# Will append best solution based on Fit ness Score at each generation and set up counter for number of generations it takes
# to crack the passcode.

success = []
generations = 0
#@time
while true
    fitnessscores = fitness(population)
    push!(success, max(i[2] for i in fitnessscores))
    if max(i[1] for i in fitnessscores) == codelength
        println("cracked in : ", generations)
        println("secret passcode: ", secretpasscode)
        println("discovered passcode: ", [i[1] for i in fitnessscores if i[2] == codelength][1])
        break
    end
    parents = selectparents(fitnessscores)
    children = createchildren(parents)
    population = mutation(children)
    generations += 1
end


