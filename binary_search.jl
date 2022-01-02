# Binary Search Algorithm
sorted_array = [1, 2, 3, 4, 5]
supremum = length(sorted_array)
infimum = 0

# Guess veriable cuts in half the some_array
guess = convert(Int64, floor(supremum))

# The variable will store the number we are looking for.
seeking = 4
if sorted_array[guess] < seeking
    infimum = convert(Int64, guess)
    guess = convert(Int64, floor((guess + supremum)/2))
end

if sorted_array[guess] > seeking
    supremum = convert(Int64, guess)
    guess = convert(Int64, floor((guess + infimum)/2))
end

println("The guess is: ", guess)