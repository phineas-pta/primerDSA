@kwdef mutable struct LRU{T<:Number}
	capacity::Unsigned
	length::Unsigned = 0
	head::Union{NodeLL{T}, Nothing} = nothing
	tail::Union{NodeLL{T}, Nothing} = nothing
	lookup::Dict{String, NodeLL{T}} = Dict{String, NodeLL{T}}()
	reverseLookup::Dict{NodeLL{T}, String} = Dict{NodeLL{T}, String}()
end

function _detach!(lru::LRU{T}, node::NodeLL{T})::Nothing where {T<:Number}
	if !isnothing(node.prev) node.prev.next = node.next end
	if !isnothing(node.next) node.next.prev = node.prev end
	if lru.head == node; lru.head = lru.head.next end
	if lru.tail == node; lru.tail = lru.tail.prev end
	node.prev = node.next = nothing
	return nothing
end

function _prepend!(lru::LRU{T}, node::NodeLL{T})::Nothing where {T<:Number}
	if isnothing(lru.head)
		lru.head = lru.tail = node
	else
		node.next = lru.head
		lru.head.prev = node
		lru.head = node
	end
	return nothing
end

function _trimCache!(lru::LRU{T})::Nothing where {T<:Number}
	if lru.length > lru.capacity
		mytail = lru.tail
		_detach!(lru, mytail)
		key = lru.reverseLookup[mytail]
		delete!(lru.lookup, key)
		delete!(lru.reverseLookup, mytail)
		lru.length -= 1
	end
	return nothing
end

# multiple dispatch functions defined in Base
function Base.get!(lru::LRU{T}, key::String)::Union{T, Nothing} where {T<:Number}
	node = get(lru.lookup, key, nothing)
	if isnothing(node)
		return nothing
	else
		_detach!(lru, node)
		_prepend!(lru, node)
		return node.value
	end
end

function update!(lru::LRU{T}, key::String, value::T)::Nothing where {T<:Number}
	node = get(lru.lookup, key, nothing)
	if isnothing(node)  # if not exist then must insert
		node = NodeLL{T}(value=value)
		lru.length += 1
		_prepend!(lru, node)
		_trimCache!(lru)
		lru.lookup[key] = node
		lru.reverseLookup[node] = key
	else
		_detach!(lru, node)
		_prepend!(lru, node)
		node.value = value
	end
	return nothing
end
