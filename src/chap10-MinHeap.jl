"""
this code is a simplified implementation of a heap (binary priority queue)

for more formal implementation: see
https://github.com/JuliaCollections/DataStructures.jl/blob/master/src/heaps.jl

multiple dispatch functions defined in Base
"""

@kwdef mutable struct MinHeap{T<:Number}
	length::Unsigned = 0
	data::Vector{T} = T[]  # store data in array for easier manipulation
end

# workaround to make it 0-based index so minimum code change
Base.firstindex(heap::MinHeap) = 0
Base.lastindex(heap::MinHeap) = heap.length - 1
function Base.getindex(heap::MinHeap{T}, idx::Integer)::Union{T, Nothing} where {T<:Number}
	return heap.data[idx+1]
end
function Base.setindex!(heap::MinHeap{T}, value::T, idx::Integer)::Nothing where {T<:Number}
	heap.data[idx+1] = value
	return nothing
end

function Base.insert!(heap::MinHeap{T}, value::T)::Nothing where {T<:Number}
	append!(heap.data, value)
	_heapifyUp!(heap, heap.length)
	heap.length += 1
	return nothing
end

# originally `delete`
function Base.pop!(heap::MinHeap{T})::Union{T, Nothing} where {T<:Number}
	if heap.length == 0 return nothing end
	out = heap[begin]
	heap.length -= 1
	if heap.length == 0
		heap.data = T[]
		return out
	end
	heap[begin] = heap[heap.length]  # do not use `heap[end]` coz `heap.data` not change yet (line below)
	_heapifyDown!(heap, 0)
	return out
end

function _heapifyUp!(heap::MinHeap{T}, idx::Integer)::Nothing where {T<:Number}
	if idx ≠ 0
		pIdx = fld(idx-1, 2)  # parent index
		v, pV = heap[idx], heap[pIdx]
		if pV > v
			heap[idx], heap[pIdx] = pV, v
			_heapifyUp!(heap, pIdx)
		end
	end
	return nothing
end

function _heapifyDown!(heap::MinHeap{T}, idx::Integer)::Nothing where {T<:Number}
	lIdx = idx * 2 + 1  #  left child index
	rIdx = lIdx    + 1  # right child index
	if idx < heap.length && lIdx < heap.length
		lV, rV, v = heap[lIdx], heap[rIdx], heap[idx]
		if lV > rV && v > rV
			heap[idx], heap[rIdx] = rV, v
			_heapifyDown!(heap, rIdx)
		elseif rV > lV && v > lV
			heap[idx], heap[lIdx] = lV, v
			_heapifyDown!(heap, lIdx)
		end
	end
	return nothing
end
