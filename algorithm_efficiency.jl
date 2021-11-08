#=
To measure algorithm performance will measure the number of steps
required to execute the algorithm.
=#

# Import necessary libraries
using Random

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
    sortedcabinet = insertion_sort(cabinet)
    return stepcounter
end

c1 = rand(0:1000, arraySize)
