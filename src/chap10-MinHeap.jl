"""
this code is a simplified implementation of a heap (binary priority queue)

for more formal implementation: see
https://github.com/JuliaCollections/DataStructures.jl/blob/master/src/heaps.jl

multiple dispatch functions defined in Base
"""

@kwdef mutable struct MinHeap{T<:Number}
	length::Unsigned = 0
	data::Vector{T} = Vector{T}()
end

# workaround to make it 0-based index so minimum code change
function Base.getindex(heap::MinHeap{T}, idx::Integer)::Union{T, Nothing} where {T<:Number}
	return heap.data[idx+1]
end
function Base.setindex!(heap::MinHeap{T}, value::T, idx::Integer) where {T<:Number}
	heap.data[idx+1] = value
end

function Base.insert!(heap::MinHeap{T}, value::T) where {T<:Number}
	append!(heap.data, value)
	heapifyUp!(heap, heap.length)
	heap.length += 1
end

# originally `delete`
function Base.pop!(heap::MinHeap{T})::Union{T, Nothing} where {T<:Number}
	if heap.length == 0 return nothing end
	out = heap[0]
	heap.length -= 1
	if heap.length == 0
		heap.data = Vector{T}()
		return out
	end
	heap[0] = heap[heap.length]
	heapifyDown!(heap, 0)
	return out
end

function heapifyUp!(heap::MinHeap{T}, idx::Integer) where {T<:Number}
	if idx == 0 return nothing end
	pIdx = fld(idx-1, 2)  # parent index
	v, pV = heap[idx], heap[pIdx]
	if pV > v
		heap[idx], heap[pIdx] = pV, v
		heapifyUp!(heap, pIdx)
	end
	return nothing
end

function heapifyDown!(heap::MinHeap{T}, idx::Integer) where {T<:Number}
	lIdx = idx * 2 + 1  # left child index
	rIdx = idx * 2 + 2  # right child index
	if idx ≥ heap.length || lIdx ≥ heap.length return nothing end

	lV, rV, v = heap[lIdx], heap[rIdx], heap[idx]
	if lV > rV && v > rV
		heap[idx], heap[rIdx] = rV, v
		heapifyDown!(heap, rIdx)
	elseif rV > lV && v > lV
		heap[idx], heap[lIdx] = lV, v
		heapifyDown!(heap, lIdx)
	end
	return nothing
end
