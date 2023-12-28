"""
this code is a simplified implementation of a stack (LIFO = last in 1st out)

for more formal implementation: see
https://github.com/JuliaCollections/DataStructures.jl/blob/master/src/stack.jl
"""

mutable struct NodeS{T<:Number}  # avoid name conflict in Queue
	const value::T
	prev::Union{NodeS{T}, Nothing}
end

# @kwdef to define default values in struct
@kwdef mutable struct Stack{T<:Number}
	length::Unsigned = 0
	head::Union{NodeS{T}, Nothing} = nothing
end

function peekk(stack::Stack{T})::Union{T, Nothing} where T<:Number  # peek already defined in Base
	return isnothing(stack.head) ? nothing : stack.head.value
end

function pushh!(stack::Stack{T}, item::T) where T  # push already defined in Base
	node = NodeS(item, nothing)
	stack.length += 1
	if !isnothing(stack.head)
		node.prev = stack.head
	end
	stack.head = node
	return nothing
end

function popp!(stack::Stack{T})::Union{T, Nothing} where T<:Number  # popp already defined in Base
	myhead = stack.head
	if isnothing(myhead) return nothing end
	stack.length -= 1
	stack.head = stack.length == 0 ? nothing : myhead.prev
	return myhead.value
end
