#=
The Linear Feedback Shift Registers
=#

#bits = [1, 1, 1]
## Will use mathematical definiton of the exlcusive OR
## Only need the sum of the second and third element since the bit list is small.
#xor_result = (bits[2] + bits[3]) % 2

## Need to remove the rightmost element of the array per the algorithm.
## Removed element will be stored in its own variable.
#output = pop!(bits)

## Now want to add the exlcusive OR result as first element in bits array 
#pushfirst!(bits, xor_result)

function feedback_shift(bits)
    xor_result = (bits[2] = bits[3]) % 2
    output = pop!(bits)
    pushfirst!(bits, xor_result)
    return bits, output
end

# A function that creates list from output bits.
function feedback_shift_list(new_bits, some_input)
    output_bits = [copy(new_bits)]
    random_output = []
    next_bits = copy(new_bits)
    while length(output_bits) < 2^(length(new_bits))
        next_bits, next = feedback_shift(next_bits)
        push!(output_bits, copy(next_bits))
        push!(random_output, next)
    end
    return output_bits, random_output
end

