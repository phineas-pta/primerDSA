"""multiple dispatch functions defined in Base"""

@kwdef mutable struct DoublyLinkedList{T<:Number}
	length::Unsigned = 0
	head::Union{Node{T}, Nothing} = nothing
	tail::Union{Node{T}, Nothing} = nothing
end

"""for debugging"""
Base.show(io::IO, arr::DoublyLinkedList) = print(io,
	"length=", arr.length,
	", head=", get_node_value(arr.head),
	", tail=", get_node_value(arr.tail)
)

# originally `getAt`, in Julia `[` auto become Base.getindex
function Base.getindex(arr::DoublyLinkedList{T}, idx::Integer)::Union{Node{T}, Nothing} where {T<:Number}
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

function Base.get(arr::DoublyLinkedList{T}, idx::Integer)::Union{T, Nothing} where {T<:Number}
	return get_node_value(arr[idx])
end

function Base.prepend!(arr::DoublyLinkedList{T}, item::T) where {T<:Number}
	node = Node(value=item)
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

function Base.append!(arr::DoublyLinkedList{T}, item::T) where {T<:Number}
	node = Node(value=item)
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
function Base.insert!(arr::DoublyLinkedList{T}, idx::Integer, item::T) where {T<:Number}
	if idx > arr.length
		error("oh no")
	elseif idx == arr.length
		append!(arr, item)
		return nothing
	elseif idx == 1
		prepend!(arr, item)
		return nothing
	end
	arr.length += 1
	curr = arr[idx]
	node = Node(value=item, prev=curr.prev, next=curr)
	curr.prev = node
	if !isnothing(node.prev)
		curr.prev.next = curr
	end
	return nothing
end

function removeNode!(arr::DoublyLinkedList{T}, node::Node{T})::Union{T, Nothing} where {T<:Number}
	arr.length -= 1
	if arr.length == 0
		tmp = get_node_value(arr.head)
		arr.head = arr.tail = nothing
		return tmp
	end
	if !isnothing(node.prev)
		node.prev.next = node.next
	end
	if !isnothing(node.next)
		node.next.prev = node.prev
	end
	if node === arr.head
		arr.head = node.next
	end
	if node === arr.tail
		arr.tail = node.prev
	end
	node.prev = node.next = nothing
	return node.value
end

function remove!(arr::DoublyLinkedList{T}, item::T)::Union{T, Nothing} where {T<:Number}
	curr = arr.head
	for i ∈ 1:arr.length
		if isnothing(curr) || curr.value == item break end
		curr = curr.next
	end
	if isnothing(curr) return nothing end
	return removeNode!(arr, curr)
end

# weird error if multiple-dispatch `Base.popat!`
function removeAt!(arr::DoublyLinkedList{T}, idx::Integer)::Union{T, Nothing} where {T<:Number}
	node = arr[idx]
	if isnothing(node) return nothing end
	return removeNode!(arr, node)
end
