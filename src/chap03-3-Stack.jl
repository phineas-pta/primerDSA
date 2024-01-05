"""
this code is a simplified implementation of a stack (LIFO = last in 1st out)

for more formal implementation: see
https://github.com/JuliaCollections/DataStructures.jl/blob/master/src/stack.jl

multiple dispatch functions defined in Base
"""

@kwdef mutable struct Stack{T<:Number}
	length::Unsigned = 0
	head::Union{NodeLL{T}, Nothing} = nothing
end

"""for debugging"""
Base.show(io::IO, stack::Stack) = print(io,
	"length=$(stack.length), head=$(get_node_value(stack.head))"
)

function Base.peek(stack::Stack{T})::Union{T, Nothing} where {T<:Number}
	return get_node_value(stack.head)
end

function Base.push!(stack::Stack{T}, item::T) where {T}
	node = NodeLL{T}(value=item)
	stack.length += 1
	if !isnothing(stack.head)
		node.prev = stack.head
	end
	stack.head = node
	return nothing
end

function Base.pop!(stack::Stack{T})::Union{T, Nothing} where {T<:Number}
	myhead = stack.head
	if isnothing(myhead) return nothing end
	stack.length -= 1
	stack.head = stack.length == 0 ? nothing : myhead.prev
	return myhead.value
end
