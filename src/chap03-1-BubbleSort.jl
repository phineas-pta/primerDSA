function bubble_sort!(arr::Vector{<:Number})
	N = length(arr)
	for i ∈ 1:N, j ∈ 1:(N-i)
		if arr[j] > arr[j+1]
			arr[j], arr[j+1] = arr[j+1], arr[j]
		end
	end
	return nothing
end
