# Algorithms

A collection of scripts about various different algorithms. Repository includes well-known search and sort algorithms, some pure math modeling, and optimization, for example.

## Mathematical

### Continued Fractions

Recall a continued fraction consists of sums and reciprocals nested in many layers. Built an algorithm in Julia to generate continued fractions. The same script will convert a continued fraction to a decimal representation of a number.

### Babylonian Algorithm

Used the Babylonian algorithm to calculate the square root of a given number. I also used the built in `sqt()` function in Julia to compute the same square root to compare the results of the algorithm. The algorithm converges to the correct answer via guess-and-check strategy.
The function takes three arguments. While loop to get small enough error. The algorithm changes between y and z being underestimate or overestimate of true value of x.

## Pseudorandom Number Generator (PRNG)

### LCR
Implemented the simplest example of a pseudorandom number generator (PRNG) a Linear Congruential Generator (LCR). First, because of the deterministic nature of computers, true randmomness is not possible by machine.

Wanted to present an example of a Diehard Test for randomness. In this case, the overlapping Sums Test. Per the figure below, the overlapping sums test favors a Gaussian distribution suggesting the LCR approaches true randomness.

<p align="center">
  <img src="https://github.com/jbravo87/algorithms/blob/4baa295b7f1efbeb144e0d5bb38b7429caa26c42/overlapping_sums_test.png"
</p>

### LFSR
For a more sophisticated PRNG, used the Linear Feedback Shift Registers. The algorithm implements the mathematical definition of exclusive OR logic.

## Advanced Optimization

### Traveling Salesperson Problem (TSP)

In reference to the `tsp.jl` script. Using TSP as an example of advanced optimization. Following plot is first iteration using a random iteration. The idea is to minimize the traveling time.
In TSP, __combinatorial__ __explosion__ happens when implementing brute force solution. This strategy uses the power of the CPU.

<p align="center">
  <img src="https://github.com/jbravo87/algorithms/blob/abae9e57cce2562f6873617ebfea9eb8d02ac808/tsp_randomitinerary.png"
</p>