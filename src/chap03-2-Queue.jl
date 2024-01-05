"""
this code is a simplified implementation of a queue (FIFO = 1st in 1st out)

for more formal implementation: see
https://github.com/JuliaCollections/DataStructures.jl/blob/master/src/queue.jl

multiple dispatch functions defined in Base
"""

@kwdef mutable struct Queue{T<:Number}
	length::Unsigned = 0
	head::Union{NodeLL{T}, Nothing} = nothing
	tail::Union{NodeLL{T}, Nothing} = nothing
end

"""for debugging"""
Base.show(io::IO, queue::Queue) = print(io,
	"length=$(queue.length), head=$(get_node_value(queue.head)), tail=$(get_node_value(queue.tail))",
)

function Base.peek(queue::Queue{T})::Union{T, Nothing} where {T<:Number}
	return get_node_value(queue.head)
end

function dequeue!(queue::Queue{T})::Union{T, Nothing} where {T<:Number}
	myhead = queue.head
	if isnothing(myhead) return nothing end
	queue.length -= 1
	queue.head = myhead.next
	if queue.length == 0
		queue.tail = nothing
	end
	return myhead.value
end

function enqueue!(queue::Queue{T}, item::T) where {T<:Number}
	node = NodeLL{T}(value=item)
	queue.length += 1
	if isnothing(queue.tail)
		queue.head = queue.tail = node
	else
		queue.tail.next = node  # order is important, DO NOT merge 2 lines
		queue.tail = node
	end
	return nothing
end
