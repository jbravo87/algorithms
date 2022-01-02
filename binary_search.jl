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