function linear_search(haystack::Vector{T}, needle::T)::Bool where {T<:Number}
	for i ∈ haystack
		if i == needle return true end
	end
	return false
end
