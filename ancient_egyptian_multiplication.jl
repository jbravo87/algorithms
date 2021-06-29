# import necessary libraries
using DataFrames

# Will use the alternate name for this historic algorithm.
# Russian peasant multiplication (rpm).
# Will take two arguments.
function rpm(n1=89, n2=18)
	# One argument will be halved and the other doubled.
	halving = [n1]
	# Remember that Julia is 1-based indexing.
	i = 1
	while halving[i] > 1
		push!( halving, floor( halving[i]/2 ) )
		i += 1
	end

	# Now to handle the doubling.
	doubling = [n2]
	j = 1
	while length( doubling ) < length( halving )
		push!( doubling, doubling[j]*2 )
		j += 1
	end

	# Now convert the vectors into dataframes.
	df1 = DataFrame(half=halving)
	df2 = DataFrame(double=doubling)

	# To join the two different DataFrames
	# Also want to assign it to a new variable
	df3 = hcat(df1, df2)

	# Next line will multiply all elements in column A and give those not equal to ten
	df4 = filter(x -> x.half .%2 == 1, df3)
	# Will return a new data frame where the rows where the 'half' column is odd.

	answer = sum(df4.double)

	return println("The product of $n1 and $n2 is $answer")
end
