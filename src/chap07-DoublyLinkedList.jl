@kwdef mutable struct DoublyLinkedList{T<:Number}
	length::Unsigned = 0
	head::Union{Node{T}, Nothing} = nothing
	tail::Union{Node{T}, Nothing} = nothing
end

"""for debugging"""
Base.show(io::IO, arr::DoublyLinkedList) = print(io,
	"length=", arr.length,
	", head=", isnothing(arr.head) ? nothing : arr.head.value,
	", tail=", isnothing(arr.tail) ? nothing : arr.tail.value
)

function prependd!(arr::DoublyLinkedList{T}, item::T) where T<:Number
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

function insertAt!(arr::DoublyLinkedList{T}, idx::Integer, item::T) where T<:Number
	if idx > arr.length
		error("oh no")
	elseif idx == arr.length
		appendd!(arr, item)
		return nothing
	elseif idx == 1
		prependd!(arr, item)
		return nothing
	end
	arr.length += 1
	curr = arr.head
	for i ∈ 2:idx
		if isnothing(curr) break end
		curr = curr.next
	end
	node = Node(value=item, prev=curr.prev, next=curr)
	curr.prev = node
	curr.prev.next = curr
	return nothing
end

function appendd!(arr::DoublyLinkedList{T}, item::T) where T<:Number
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

function remove!(arr::DoublyLinkedList{T}, item::T)::Union{T, Nothing} where T<:Number
	curr = arr.head
	for i ∈ 1:arr.length
		if isnothing(curr) || curr.value == item break end
		curr = curr.next
	end
	if isnothing(curr) return nothing end
	arr.length -= 1
	if arr.length == 0
		tmp = arr.head
		arr.head = arr.tail = nothing
		return isnothing(tmp) ? nothing : tmp.value
	end
	if !isnothing(curr.prev)
		curr.prev = curr.next
	end
	if !isnothing(curr.next)
		curr.next = curr.prev
	end
	if curr === arr.head
		arr.head = curr.next
	end
	if curr === arr.tail
		arr.tail = curr.prev
	end
	return curr.value
end

function gett(arr::DoublyLinkedList{T}, idx::Integer)::Union{T, Nothing} where T<:Number
	if idx > arr.length
		error("oh no")
	elseif idx == arr.length
		return arr.tail.value
	elseif idx == 1
		return arr.head.value
	end
	curr = arr.head
	for i ∈ 2:idx
		if isnothing(curr) break end
		curr = curr.next
	end
	return isnothing(curr) ? nothing : curr.value
end

function removeAt!(arr::DoublyLinkedList{T}, idx::Integer)::Union{T, Nothing} where T<:Number
	curr = arr.head
	if idx > arr.length
		error("oh no")
	elseif idx == arr.length
		curr = arr.tail
	elseif idx > 1
		for i ∈ 2:idx
			curr = curr.next
		end
	end
	if isnothing(curr) return nothing end
	arr.length -= 1
	if arr.length == 0
		tmp = arr.head
		arr.head = arr.tail = nothing
		return isnothing(tmp) ? nothing : tmp.value
	end
	if !isnothing(curr.prev)
		curr.prev = curr.next
	end
	if !isnothing(curr.next)
		curr.next = curr.prev
	end
	if curr === arr.head
		arr.head = curr.next
	end
	if curr === arr.tail
		arr.tail = curr.prev
	end
	return curr.value
end
