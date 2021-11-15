###############################################
# left and right arrays will be the name of the
# two lists we will merge together
###############################################

new_array = []

left_array = [1,3,4,4,5,7,8,9]
right_array = [2,4,6,7,8,8,10,12,13,14]

# Conditional statement to compare first elements of each array.
if (left_array[1] > right_array[1])
	to_insert = right_array[1]
	push!(new_array, to_insert)
else
	to_insert = left_array[1]
	push!(new_array, left_array[1])
end

###############################################
# Nest if statements inside a while loop that
# will verify minimum length of given arrays.
###############################################

while min(length(left_array), length(right_array)) > 0
	if (left_array[1] > right_array[1])
		to_insert = right_array[1]
		push!(new_array, to_insert)
	else
		to_insert = left_array[1]
		push!(new_array, left_array[1])
	end
end

# The above creates an infinite loop.
# Need a call to remove that element from initial array to new array.

while min(length(left_array), length(right_array)) > 0
	if (left_array[1] > right_array[1])
		to_insert = right_array[1]
		push!(new_array, to_insert)
		deleteat!(right_array, 1)
	else
		to_insert = left_array[1]
		push!(new_array, left_array[1])
		deleteat!(left_array, 1)
	end
end

# The above logic stops once one of the arrays is empty
# But other array still has elements.
###############################################
# Stops executing as soon as one of the arrays
# runs out of elements to insert.
###############################################

#if (length(left_array) > 0)
#	for j in left_array
#		push!(new_array, j)
#	end
#end

#if (length(right_array) > 0)
#	for j in right_array
#		push!(new_array, j)
#	end
#end
#=
Above logic will insert all the elements in the right_array
at end of new array in current order.
=#

# Now, to combine all the logic into one cohesive function.
function merging_sort(left_array, right_array)
	new_array = []
	while min(length(left_array), length(right_array)) > 1
		if (left_array[1] > right_array[1])
			to_insert = right_array[1]
			push!(new_array, to_insert)
			deleteat!(right_array, 1)
		else
			to_insert = left_array[1]
			push!(new_array, left_array[1])
			deleteat!(left_array, 1)
		end
	end
	if (length(left_array) > 0)
		for j in left_array
			push!(new_array, j)
		end
	end
	if (length(right_array) > 0)
		for j in right_array
			push!(new_array, j)
		end
	end
	return new_array
end

array1 = [1, 34, 55, 65, 72, 83 , 94, 103, 109, 109, 110]
array2 = [23, 30, 45, 45, 98, 567]

some_array = merging_sort(array1, array2)

array3 = [34, 35, 37, 38, 45, 46, 47, 48, 99, 100]
array4 = [10, 11, 12, 13, 14, 14, 15, 15, 15, 20, 21, 22]
some_array2 = merging_sort(array3, array4)

#=
Function works only if two arrays in the function
argument are already sorted then merges the
two sorted lists.
=#
