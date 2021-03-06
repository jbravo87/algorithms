#=
To measure algorithm performance will measure the number of steps
required to execute the algorithm.
=#

# Import necessary libraries
using Random
using Plots

function first_sort(array, to_insert )
    # Length of the array stored into variable.
    location_check = length(array)
    # Initializing iterator
    location_insert = 1
    # Introduce the step counting variable.
    global stepcounter
    while location_insert <= location_check
        # Every run through the while loop will update the variable.
        stepcounter += 1
        # Conditional if element is greater than last element.
        if to_insert > array[location_check]
            location_insert = location_check + 1
            location_check = lastindex(array)
        end
        # Updating iterator
        location_check -= 1
    end
    stepcounter += 1
    # Adding all the logic together.
    insert!(array, location_insert, to_insert)
    return array
end

function insert_sort(array)
    sorted_array = []
    global stepcounter
    j = 1
    while length(array) > j-1
        stepcounter += 1
        to_insert = array[j]
        sorted_array = first_sort(sorted_array, to_insert)
        j += 1
    end
    return sorted_array
end

# Following is a test for the final function.
cabinet = [36, 4, 67, 990, 234, 5, 6, 32, 1, 12, 178, 123, 144, 1, 2, 2, 87]
stepcounter = 0
soretedcabinet = insert_sort(cabinet)
print(stepcounter)

function check_steps(array_size)
    cabinet = rand(0:100, array_size)
    global stepcounter
    stepcounter = 0
    sortedcabinet = insert_sort(cabinet)
    return stepcounter
end

arraySize = 10
c1 = rand(0:1000, arraySize)
y1 = [y for y in 1:10]

x1 = insert_sort(c1)

# Testing the function
check_steps(1158)

typeof(c1)

#x2 = rand(0:100, arraySize)
#x3 = insert_sort(x2)
#y2 = [check_steps(i) for i in x3]
#print(y2)

#  First initiate empty array then for loop to
# fill with integers from 1 to 100.
x4 = []
for j = 1:100
    push!(x4, j)
end

# Making sure it is a list
typeof(x4)

y4 = [check_steps(i) for i in x4]

# Plotting
#plot(x3, y2, color = :darkviolet,
#             title = "Steps Required for Insertion Sort for Random Array",
#             xlabel = "Number of Elements in Random Array",
#             ylabel = "Steps Required to Sort Array by Insertion Sort",
#             legend = false,
#             lw = 1)

# Comparing it to the exponential function
y4_exp = [exp(x) for x in x4]

# Supremum of an array
maximum(y4)
# Infimum of an array
minimum(y4)

# Last element of the array
last(y4)

plot(x4, y4, ylim=(minimum(y4), maximum(y4)),
             color = :darkorange,
             title = "Steps Required for Insertion Sort for Random Array",
             xlabel = "Number of Elements in Random Array",
             ylabel = "Steps Required to Sort Array by Insertion Sort",
             label = "Insert Sort Algo",
             lw = 1)

# Adding the exponential model
plot!(y4_exp, color=:roma, label = "Exponential Model")

#=
Can see how growth of the number of steps required to sort
a list relates to true exponential growth
=#

# Linear Model
plot!(x4, x4, color=:firebrick, label = "Linear (x4)") # No error here

# Establish squared model
x_squared = [i^2 for i in x4]

# Create threehalves model
x_threehalves = [j^1.5 for j in x4]

# Create cubed model
x_cubed = [k^3 for k in x4]

# The following will add the other models to the primary plot
plot!(x4, x_squared, color=:cyan3, label = "Squared")
plot!(x4, x_threehalves, color=:limegreen, label = "Three Halves Power")
plot!(x4, x_cubed, color=:rebeccapurple, label = "Cubed")

#=
Final plot includes 5 growth models.
The insertion sort is between x^1.5 and x^2 models.
=#

#save plot as portable network graphic
png("C:\\Users\\Tech\\Desktop\\algorithm_efficiency.png")
