"""binary search, array must be sorted"""
function bs_list(haystack::Vector{T}, needle::T)::Bool where T<:Number
	lo = 0
	hi = length(haystack)
	while lo < hi
		m = floor(Int, lo + (hi-lo)/2)  # must force casting
		v = haystack[m+1]  # small hack for 1-based indexing
		if v == needle
			return true
		elseif v > needle
			hi = m
		else
			lo = m + 1
		end
	end
	return false
end
