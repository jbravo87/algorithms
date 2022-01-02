# A function to sort using the sleep function
function sleep_sort(i)
    sleep(i)
    global sortedlist
    push!(sortedlist, i)
    return i
end

some_array = [2, 4, 5, 2, 1, 7]
sortedlist = []

ignore_result = Threads.@threads for i = 1:length(some_array)
    sortedlist[i] = sleep_sort(i)
end

ignore_result
sortedlist
