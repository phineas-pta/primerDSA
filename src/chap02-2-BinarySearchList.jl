"""binary search, array must be sorted, complexity now become 𝒪(㏒n)"""
function bs_list(haystack::Vector{T}, needle::T)::Bool where {T<:Number}
	lo = 0
	hi = length(haystack)
	while lo < hi
		m = floor(Int, lo + (hi-lo)/2)  # mid-point (must force casting type)
		v = haystack[m+1]  # small hack for 1-based indexing
		if v == needle
			return true
		elseif v > needle
			hi = m  # look at lower (left) half
		else
			lo = m + 1  # look at upper (right) half
		end
	end
	return false
end
