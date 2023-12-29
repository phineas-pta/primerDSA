function linear_search(haystack::Vector{T}, needle::T)::Bool where {T<:Number}
	for i ∈ 1:length(haystack)
		if haystack[i] == needle
			return true
		end
	end
	return false
end
