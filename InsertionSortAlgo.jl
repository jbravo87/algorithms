#=
A version of the Insertion SOrt algorithm.
Note that the array input into argument of the function will not
be sorted before giving it a new element to put into the array.
=#

function insertsortalgo(array, to_insert )
    # Length of the array stored into variable.
    location_check = length(array)
    # Initializing iterator
    location_insert = 1
    while location_insert <= location_check
        # Conditional if element is greater than last element.
        if to_insert > array[location_check]
            location_insert = location_check + 1
            location_check = lastindex(array)
        end
        # Updating iterator
        location_check -= 1
    end
    # Adding all the logic together.
    insert!(array, location_insert, to_insert)
    return array
end

# The following lines test the above function.
#=
fileCabinet = [1, 2, 2, 3, 3, 4, 6, 8, 12]
toInsert = 5
newcabinet = insertsortalgo(fileCabinet, toInsert)
print(newcabinet)
=#

function insertion_sort(array)
    sorted_array = []
    j = 1
    while length(array) > 1
        #to_insert = deleteat!(array, 1)
        #to_insert = filter( x -> x == array[1], array )

        sorted_array = insertsortalgo(sorted_array, to_insert)
    end
    return sorted_array
end

cabinet = [8, 4, 6, 1, 2, 5, 3, 7]
sortedcabinet = insertion_sort(cabinet)
print(sortedcabinet)
