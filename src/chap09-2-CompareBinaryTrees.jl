"""multiple dispatch functions defined in Base"""

# originally `compare`
function Base.:(==)(a::Union{NodeBT{T}, Nothing}, b::Union{NodeBT{T}, Nothing})::Bool where {T<:Number}
	if isnothing(a) || isnothing(b)  # structural check
		return isnothing(a) && isnothing(b)  # must be true when comparing 2 null children
	end
	if a.value ≠ b.value return false end
	return a.left == b.left && a.right == b.right
end
