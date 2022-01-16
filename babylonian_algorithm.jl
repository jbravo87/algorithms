#= Babylonian Algorithm
Will use to calculate square root of some number x. Will use variables y and z
to get to the square root with some permisable error. Script defines function with 3
arguments, x, y, and error tolerance. While loop will run to get small enough error.
=#

function square_root(x, y, error_tolerance)
    new_error = error_tolerance * 2
    while new_error > error_tolerance
        z = x/y
        y = (y + z)/2
        new_error = y^2 - x
    end
    return y
end

square_root(5, 1, .000000000000001)
sqrt(5)