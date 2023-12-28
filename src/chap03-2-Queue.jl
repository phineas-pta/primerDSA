"""
this code is a simplified implementation of a queue (FIFO = 1st in 1st out)

for more formal implementation: see
https://github.com/JuliaCollections/DataStructures.jl/blob/master/src/queue.jl
"""

mutable struct NodeQ{T<:Number}  # avoid name conflict in Stack
	const value::T
	next::Union{NodeQ{T}, Nothing}
end

# @kwdef to define default values in struct
@kwdef mutable struct Queue{T<:Number}
	length::Unsigned = 0
	head::Union{NodeQ{T}, Nothing} = nothing
	tail::Union{NodeQ{T}, Nothing} = nothing
end

function peekk(queue::Queue{T})::Union{T, Nothing} where T<:Number  # peek already defined in Base
	return isnothing(queue.head) ? nothing : queue.head.value
end

function dequeue!(queue::Queue{T})::Union{T, Nothing} where T<:Number
	myhead = queue.head
	if isnothing(myhead) return nothing end
	queue.length -= 1
	queue.head = myhead.next
	if queue.length == 0
		queue.tail = nothing
	end
	return myhead.value
end

function enqueue!(queue::Queue{T}, item::T) where T<:Number
	node = NodeQ(item, nothing)
	queue.length += 1
	if isnothing(queue.tail)
		queue.head = queue.tail = node
	else
		queue.tail.next = node  # order is important, DO NOT merge 2 lines
		queue.tail = node
	end
	return nothing
end
