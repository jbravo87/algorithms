#=
Julia script to model the trajectory of a traveling ball.
=#

function ball_trajectory( x )
        location = 10*x - 5*(x^2)
        return location
end
