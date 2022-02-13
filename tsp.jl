"""
Created on Sunday Jan 23 2022

@author: J. Bravo
"""
# Import necessary librarie(s)
using Random

#Random.seed!(3); randstring()

# Random Number Generator -> rng
rng = Random.seed!(1729)

N = 41

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

# This try uses the vector in itinerary to determine the lines.
lines5 = []

#for i in itinerary <- Doesn't work. Throws error that attempt to access 41-element array at element 42.
for i in 1 : N - 1
push!(lines5, [[cities[itinerary[i], 1], cities[itinerary[i], 2]], [cities[itinerary[i+1], 1], cities[itinerary[i + 1], 2]]])
end

points2 = []

for i in 1:N
    push!(points2, (x[i], y[i]))
end

points2

#for k in 1:N-1
#    push!(lines, ([cities[k, k], cities[k, 2]]))
#end

lines2 = []
for j in 1:N-1
    push!(lines2, [[x[j], y[j]], [x[j + 1], y[j + 1]]])
end

lines3 = []
for k in 1:N - 1
    push!(lines3, [[cities[k, 1], cities[k, 2]], [cities[k+1, 1], cities[k+1, 2]]])
end

# Will calculate Euclidean Distance
euclid_dist = sqrt(abs(lines3[1][2][1] - lines3[1][1][1])^2 + abs(lines3[1][2][2] - lines3[1][1][2])^2)
println("The euclidean distance is: ", euclid_dist)

lines4 = []
for i in 1:N-1
    push!(lines4, [[cities[i, 1], cities[i, 2]], [cities[i+1, 1], cities[i+1, 2]]])
end

# For number of rows of a given array
size(cities, 1)
# For number of columns of a given array
size(cities, 2)

# Now want to bundle into a function.
# Will take two arguements.
# An N x 2 matrix for x and y coordinates, and N <- number of cities
function create_lines(cities, itinerary)
    n = size(cities, 1) - 1
    lines = []
    for k in 1:n
        push!(lines, [[cities[itinerary[k], 1], cities[itinerary[k], 2]], [cities[itinerary[k+1], 1], cities[itinerary[k+1], 2]]])
    end
    return lines
end

trip2 = sqrt(abs(lines5[1][2][1] - lines5[1][1][1])^2 + abs(lines5[1][2][2] - lines5[1][1][2])^2)
println("The euclidean distance is: ", trip2)

function displacement( lines )
    distance = 0
    for j in 1:length(lines)
        distance += sqrt(abs(lines[j][2][1] - lines[j][1][1])^2 + abs(lines[j][2][2] - lines[j][1][2])^2)
    end
    return distance
end

totaldistance = displacement(create_lines(cities, itinerary))
println( "The total distance is: ", totaldistance, " units" )

using Plots
#plot(x, y; marker=(:star8,5), linecolor = :steelblue, markercolor = :darkred, legend = false)
plot(x, y; linecolor = :steelblue)
plot!(xlabel = "x coordinate")
plot!(ylabel = "y coordinate")
plot!(title = "tsp - random itinerary")

# Will now implement the nearest neighbor algorithm.
# Following will lead to function that finds the nearest neighbor
point = [0.5, 0.5]
j = 10
#distance = sqrt((point[1] - cities[j][1])^2 + (point[2] - cities[j][2])^2)
distance = sqrt((point[1] - cities[j, 1])^2 + (point[2] - cities[j, 2])^2)
print("the total distance is: ", distance)

# beginning the implementation of the nearest-neighbor algorithm
# First, function to determine nearest neighbor of any city.
some_point = [0.5, 0.5]
j = 10
distance = sqrt((point[1] - cities[j, 1])^2 + (point[2] - cities[j, 2])^2)

function findnearest(cities, idx, nnitinerary)
    point = cities[idx]
    mindistance = Inf32
    minidx = 1
    for i in 1:length(cities)
        distance = sqrt((point[1] - cities[i, 1])^2 + (point[2] - cities[i, 2])^2)
        if distance < mindistance && distance > 0 && i ∉ nnitinerary
            mindistance = distance
            minidx = i
        end
    end
    return minidx
end
# Do Nearest Neighbor <- from first city then adds closest city at every step to
# most recetly added city until all cities have been visited.
function donn(cities, N)
    # First city is where the salesperson starts.
    nnitinerary = [0]
    for k in 1:N
        next = findnearest(cities, nnitinerary[length(nnitinerary)], nnitinerary)
        push!(nnitinerary, next)
    end
    return nnitinerary
end

