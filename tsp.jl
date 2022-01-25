"""
Created on Sunday Jan 23 2022

@author: J. Bravo
"""
# Import necessary librarie(s)
using Random

#Random.seed!(3); randstring()

# Random Number Generator -> rng
rng = Random.seed!(1729)

N = 40

# A random permutation command experimented with
#randperm(rng, N)

# Setting up some arrays that will serve as point for the cities in the TSP example.
# Call the random number Generator
rng
x = rand(N)
y = rand(N)
points = hcat(x, y)
cities = points
#itinerary = Vector(1:N)
itinerary = 1:N

# Functio that creates collection of lines connecting all the points.
lines = []
#for k in 1:length(itinerary)
#for k in itinerary
#    push!cities(lines, (cities[itinerary[k]], cities[itinerary[k+1]]))
#end
println("Consider the following:")
for i in 1:N-1
    println(cities[itinerary[i]], cities[itinerary[i+1]])
end

points2 = []

for i in 1:N
    push!(points2, (x[i], y[i]))
end

points2

for k in 1:39
    push!(lines, ([cities[itinerary[k]], cities[itinerary[k+1]]]))
end