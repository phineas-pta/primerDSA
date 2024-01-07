"""
given 2 crystal balls that will break if dropped from high enough distance,
determine the exact spot in which they will break in the most optimized way

mathematically: given a boolean array [F, …, F, T …, T] find index where flipped

this algorithm has time complexity O(√N) comparing to O(N) in normal search algo
"""
function two_crystal_balls(breaks::Vector{Bool})::Integer
	N = length(breaks)
	jmpAmount = isqrt(N)  # floor(Int, √N)
	i = 0  # re-used outside for loop
	for outer i ∈ jmpAmount:jmpAmount:N
		if breaks[i] break end
	end
	i -= jmpAmount  # go back then walk √N
	j = 1
	while i ≤ N && j ≤ jmpAmount  # julia for loop syntax not suitable
		if breaks[i] return i end
		i += 1
		j += 1
	end
	return -1
end
