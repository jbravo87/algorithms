#=
Start of file 'codebreakingalgo.jl'
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
passcode_length = 10
passcode_infimum = 0
passcode_supremum = 9

# List of valid genes.
#=
Set up parameters for each generation including number of potential solutions to try, how many parents want to select from each
    population to breed from, and how many elite/chosen/favorable chromosomes will be passed through as children without (any) breeding.
=#
population_size = 10
num_parents = 5
favorable_size = 2

# Create secret passcode that will be cracked.
secret_code = []
for i in 1:passcode_length
    #println(codelength)
    push!(secret_code, rand(passcode_infimum : passcode_supremum))
end
println(secret_code)

# Now to create initial population. Ten randomly generated passcodes of length ten digits.
population = []
for j in 1:population_size
    chromosomes = []
    for k in 1:passcode_length
         push!(chromosomes, rand(passcode_infimum:passcode_supremum))
    end
    push!(population, chromosomes)
end
println("The following is the initial population: ", population)
#=
Need to set-up function for the various evolutionary stages including:
1. Fitness Scoring
2. Selecting parents
3. Breeding to create new children
4. Mutation
=#
# Fitness Scoring
function fitness(population)
    global fitness_scores = []
    for chromosome in population
        matches = 0
        for index in 1:passcode_length
            if secret_code[index] == chromosome[index]
                matches += 1
            end
        end
        result = [chromosome, matches]
        push!(fitness_scores, result)
    end
    return fitness_scores
end

#Selecting Parents
function selectparents(fitness_scores)
    parents_list = []
    sorted_list = sort(fitness_scores, by = x -> x[2], rev=true)
    for chromosome in sorted_list
        push!(parents_list, chromosome[1])
    end
    return parents_list
end
#=
Breeding to create new Children.
1st function is breeding logic. Two parents have randomly selected start and end cut point position.
Positions are used to combine the Genes of two parents to create new Child.
Second function used to select parents who make it to breeding to create enough children for a new
population. Elitism/favorable incorporated here.
=#
parents = selectparents(fitness_scores)
# First, breeding logic
function breed(parent1, parent2)
    child = []
    parent1 = parents[1]
    parent2 = parents[2]
    geneA = Int(round(rand()*passcode_length))
    geneB = Int(round(rand()*passcode_length))
    start_gene = min(geneA, geneB)
    end_gene = max(geneA, geneB)
    for i in 1:passcode_length
        if i < start_gene || i > end_gene
            push!(child, parent1[i])
        else
            push!(child, parent2[i])
        end
    end
    return child
end

# Breeding and elitism/favorable
function createchildren(parents_pool)
    children = []
    num_newchildren = length(population) - favorable_size
    for x in 1:favorable_size
        push!(children, parents_pool[x])
    end
    for y in 1:num_newchildren
        #parent1 = parents_pool[Int(round(rand()*length(parents_pool)))]
        #parent2 = parents_pool[Int(round(rand()*length(parents_pool)))]
        # Will use the ceiling function in Julia to round to 1 as opposed to zero to avoid
        # index at 0 which Julia flags
        parent1 = parents_pool[Int(ceil(rand()*length(parents_pool)))]
        parent2 = parents_pool[Int(ceil(rand()*length(parents_pool)))]
        push!(children, breed(parent1, parent2))
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
            mutated_position = Int(round(rand()*passcode_length))
            mutation = Int(round(passcode_supremum*(1-rand())))
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
#= while true
    fitness_scores = fitness(population)
    push!(success, max(i[2] for i in fitness_scores))
    if max(i[1] for i in fitness_scores) == passcode_length
        println("cracked in : ", generations)
        println("secret passcode: ", secret_code)
        println("discovered passcode: ", [i[1] for i in fitness_scores if i[2] == passcode_length][1])
        break
    end
    parents = selectparents(fitness_scores)
    children = createchildren(parents)
    population = mutation(children)
    generations += 1
end =#
x1 = fitness(population)
x2 = selectparents(x1)
x3 = createchildren(x2)
x4 = mutation(x3)
while true
    push!(success, max(i[2] for i in x1))
    if max(i[1] for i in x1) == passcode_length
        println("cracked in : ", generations)
        println("secret passcode: ", secret_code)
        println("discovered passcode: ", [i[1] for i in x1 if i[2] == passcode_length][1])
        break
    end
    global generations += 1
end