"""multiple dispatch functions defined in Base"""

@kwdef mutable struct DoublyLinkedList{T<:Number}
	length::Unsigned = 0
	head::Union{NodeLL{T}, Nothing} = nothing
	tail::Union{NodeLL{T}, Nothing} = nothing
end

"""for debugging"""
Base.show(io::IO, arr::DoublyLinkedList) = print(io,
	"length=$(arr.length), head=$(get_node_value(arr.head)), tail=$(get_node_value(arr.tail))"
)

# originally `getAt`, in Julia `[` auto become Base.getindex
function Base.getindex(arr::DoublyLinkedList{T}, idx::Integer)::Union{NodeLL{T}, Nothing} where {T<:Number}
	if idx > arr.length
		error("oh no")
	elseif idx == 1
		return arr.head
	elseif idx == arr.length
		return arr.tail
	end
	curr = arr.head
	for i ∈ 2:(arr.length-1)  # more proper indexing
		curr = curr.next
	end
	return curr
end

#= ## implement some interesting Julia interfaces (not used)
# to use `arr[begin]` & `arr[end]`
Base.firstindex(arr::DoublyLinkedList) = 0
Base.lastindex(arr::DoublyLinkedList) = arr.length - 1

# to use `for i ∈ arr`
function Base.iterate(arr::DoublyLinkedList{T}, (el, i)=(arr.head, 1)) where {T<:Number}
	if i > arr.length || isnothing(el)
		return nothing
	else
		return (el, (el.next, i + 1))
	end
end
=#

function Base.get(arr::DoublyLinkedList{T}, idx::Integer)::Union{T, Nothing} where {T<:Number}
	return get_node_value(arr[idx])
end

function Base.prepend!(arr::DoublyLinkedList{T}, item::T)::Nothing where {T<:Number}
	node = NodeLL{T}(value=item)
	arr.length += 1
	if isnothing(arr.head)
		arr.head = arr.tail = node
	else
		node.next = arr.head
		arr.head.prev = node
		arr.head = node
	end
	return nothing
end

function Base.append!(arr::DoublyLinkedList{T}, item::T)::Nothing where {T<:Number}
	node = NodeLL{T}(value=item)
	arr.length += 1
	if isnothing(arr.tail)
		arr.head = arr.tail = node
	else
		node.prev = arr.tail
		arr.tail.next = node
		arr.tail = node
	end
	return nothing
end

# originally `insertAt`
function Base.insert!(arr::DoublyLinkedList{T}, idx::Integer, item::T)::Nothing where {T<:Number}
	if idx > arr.length
		error("oh no")
	elseif idx == arr.length
		append!(arr, item)
	elseif idx == 1
		prepend!(arr, item)
	else
		arr.length += 1
		curr = arr[idx]
		node = NodeLL{T}(value=item, prev=curr.prev, next=curr)
		curr.prev = node
		if !isnothing(node.prev)
			curr.prev.next = curr
		end
	end
	return nothing
end

function _removeNode!(arr::DoublyLinkedList{T}, node::NodeLL{T})::Union{T, Nothing} where {T<:Number}
	arr.length -= 1
	if arr.length == 0
		tmp = get_node_value(arr.head)
		arr.head = arr.tail = nothing
		return tmp
	end
	if !isnothing(node.prev) node.prev.next = node.next end
	if !isnothing(node.next) node.next.prev = node.prev end
	if node === arr.head; arr.head = node.next end
	if node === arr.tail; arr.tail = node.prev end
	node.prev = node.next = nothing  # for garbage collection
	return node.value
end

function remove!(arr::DoublyLinkedList{T}, item::T)::Union{T, Nothing} where {T<:Number}
	curr = arr.head
	for i ∈ 1:arr.length
		if isnothing(curr) || curr.value == item break end
		curr = curr.next
	end
	return isnothing(curr) ? nothing : _removeNode!(arr, curr)
end

# weird error if multiple-dispatch `Base.popat!`
function removeAt!(arr::DoublyLinkedList{T}, idx::Integer)::Union{T, Nothing} where {T<:Number}
	node = arr[idx]
	return isnothing(node) ? nothing : _removeNode!(arr, node)
end
