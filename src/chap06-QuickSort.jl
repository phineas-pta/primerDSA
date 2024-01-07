"""return the pivot index, also move smaller items to left side and bigger items to right side"""
function _partition(arr::Vector{<:Number}, lo::Integer, hi::Integer)::Integer
	pivot = arr[hi]  # where to split the array
	idx = lo - 1
	for i ∈ lo:(hi-1)  # must exclude otherwise overflow error
		if arr[i] ≤ pivot
			idx += 1
			arr[i], arr[idx] = arr[idx], arr[i]
		end
	end
	idx += 1
	arr[hi], arr[idx] = arr[idx], pivot
	return idx
end

"""mostly bookkeeping"""
function _qs!(arr::Vector{<:Number}, lo::Integer, hi::Integer)::Nothing
	if lo ≥ hi return nothing end
	pivotIdx = _partition(arr, lo, hi)
	_qs!(arr, lo, pivotIdx-1)
	_qs!(arr, pivotIdx+1, hi)
	return nothing
end

function quick_sort!(arr::Vector{<:Number})::Nothing
	_qs!(arr, 1, length(arr))
	return nothing
end
