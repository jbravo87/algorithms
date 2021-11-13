###############################################
# left and right arrays will be the name of the
# two lists we will merge together
###############################################

new_array = []

left_array = [1,3,4,4,5,7,8,9]
right_array = [2,4,6,7,8,8,10,12,13,14]

# Conditional statement to compare first elements of each array.
if (left[1] > right[1])
	to_insert = right[1]
	push!(new_array, to_insert)
else
	to_insert = left[1]
	push!(new_array, left[1])
end

###############################################
# Nest if statements inside a while loop that
# will verify minimum length of given arrays.
###############################################

while min(length(left_array), length(right_array)) > 0
	if (left[1] > right[1])
		to_insert = right[1]
		push!(new_array, to_insert)
	else
		to_insert = left[1]
		push!(new_array, left[1])
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
# Stops eecuting as soon as one of the arrays 
# runs out of elements to insert.
###############################################

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
