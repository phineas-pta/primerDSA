function partition(arr::Vector{<:Number}, lo::Integer, hi::Integer)::Integer
	pivot = arr[hi]
	idx = lo - 1
	for i ∈ lo:(hi-1)  # must exclude otherwise overflow error
		if arr[i] <= pivot
			idx += 1
			arr[i], arr[idx] = arr[idx], arr[i]
		end
	end
	idx += 1
	arr[hi], arr[idx] = arr[idx], pivot
	return idx
end

function qs!(arr::Vector{<:Number}, lo::Integer, hi::Integer)
	if lo >= hi return nothing end
	pivotIdx = partition(arr, lo, hi)
	qs!(arr, lo, pivotIdx-1)
	qs!(arr, pivotIdx+1, hi)
	return nothing
end

function quick_sort!(arr::Vector{<:Number})
	qs!(arr, 1, length(arr))
	return nothing
end
