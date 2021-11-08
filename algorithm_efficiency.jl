#=
Insertion-Sort Algorithm. Has two functions. First will insert an element
in an array. The second will use the first to sort an entire unsorted array.
=#

function first_sort(array, to_insert )
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

function insert_sort(array)
    sorted_array = []
    j = 1
    while length(array) > j-1
        to_insert = array[j]
        sorted_array = first_sort(sorted_array, to_insert)
        j += 1
    end
    return sorted_array
end

# Following is a test for the final function.
someArray = [3, 54, 678, 990, 23, 35, 6, 3, 1, 2, 78, 123, 144, 1, 2, 2, 87]
x=insertion_sort(someArray)
print(x)
