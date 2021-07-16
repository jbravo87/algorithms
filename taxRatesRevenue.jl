# Import necessary libraries.
using Plots

function revenue( tax )
	return(100 * (log(tax+1) - (tax - 0.2)^2 + 0.04))
end

# Good example of list comprehension in Julia.
xs = [x/1000 for x=0:1000]
ys = [revenue(x) for x in xs]

current_rate = 0.7
# The plotting logic.
plot(xs, ys, title = "Tax Rates and Revenue", label = "")
xlabel!("Tax Rate")
ylabel!("Revenue")
# Following line will plot a single point given two coordinates.
scatter!([current_rate], [revenue(current_rate)], color = "green", label = "", markersize = 5)

# Following will save the current plot as .png
#savefig("taxraterevenue.png")
