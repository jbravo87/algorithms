def gcd(a, b):
    larger = max(a, b)
    smaller = min(a, b)

    remainder = larger % smaller
    if(remainder == 0):
        return(smaller)

    if(remainder != 0):
        return(gcd(smaller, remainder))


x = 36
y = 48
print(gcd(x, y))
