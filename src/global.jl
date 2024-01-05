"""objects re-used elsewhere"""

# @kwdef to define default values in struct

@kwdef mutable struct NodeLL{T<:Number}  # used in linked list struct (stack, queue, doubly) and LRU
	const value::T
	prev::Union{NodeLL{T}, Nothing} = nothing
	next::Union{NodeLL{T}, Nothing} = nothing
end

@kwdef mutable struct NodeBT{T<:Number}  # binary tree itself
	const value::T
	right::Union{NodeBT{T}, Nothing} = nothing
	left::Union{NodeBT{T}, Nothing} = nothing
end

"""for debugging"""
function get_node_value(node::Union{NodeLL{T}, NodeBT{T}, Nothing})::Union{T, Nothing} where {T<:Number}
	return isnothing(node) ? nothing : node.value
end

struct GraphEdge
	to::Unsigned
	weight::Unsigned
end
