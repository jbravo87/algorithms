# Binary Search Algorithm
sortedarray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
sortedarray2 = [34, 35, 36, 37, 38, 39, 40]
function binarysearch(array, seeking)
    # Guess veriable cuts in half the some_array
    guess = floor(length(array)/2)
    guess = convert(Int64, guess)
    supremum = length(array)
    infimum = 0
    while(abs(array[guess] - seeking) > 0.0001)
        if array[guess] > seeking
            supremum = guess
            guess = floor((guess + infimum)/2)
            guess = convert(Int64, guess)
        end
        if array[guess] < seeking
            infimum = guess
            guess = floor((guess + supremum)/2)
            guess = convert(Int64, guess)
        end
    end
    return(guess)
end

# Below creates infinite loop because evaluating an array where the 'seeking'
# does not exits, hence the while loop will evaluate forever.
#println(binarysearch(sortedarray, 38))

println("The number 38 in the array is in position: ", binarysearch(sortedarray2, 38))

#=
    Will use binary search to invert the cosine function.
    Call the binary search to get correct answer.
=#

function arccos(number)
    an_array = [j for j in 1:10000]
    domain = [pi/2 - i*(pi/10000) for i in an_array]
    codomain = [cos(x) for x in domain]
    result = domain[binarysearch(codomain, number)]
    return result
end

println("\nThe inverse cosine of 0.9 is: ", arccos(0.9))

# Now want to plot the function if indeed looks like inverse cosine

#x = []
#for i = 1
a, b, c = (-pi/2), (pi/2), 10000
n = (b - a)/(c - 1)
x = collect(a:n:b)

y = [arccos(i) for i in x]

x4 = []
for j = -1:0.0001:1
    push!(x4, j)
end

y4 = []
for i in x4
    push!(arccos(x4), y4)
end

y4 = [arccos(i) for i in x4]
arccos(-1.0)
