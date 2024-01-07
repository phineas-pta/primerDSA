# complexity 𝒪(n²)
function bubble_sort!(arr::Vector{<:Number})::Nothing
	N = length(arr)
	for i ∈ 1:(N-1), j ∈ 1:(N-i)
		if arr[j] > arr[j+1]  # if bigger then swap
			arr[j], arr[j+1] = arr[j+1], arr[j]
		end
	end
	return nothing
end
