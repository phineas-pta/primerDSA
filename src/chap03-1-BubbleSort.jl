function bubble_sort!(arr::Vector{<:Number})
	N = length(arr)
	for i ∈ 1:N
		for j ∈ 1:(N-i)
			if arr[j] > arr[j+1]
				arr[j], arr[j+1] = arr[j+1], arr[j]
			end
		end
	end
	return nothing
end
