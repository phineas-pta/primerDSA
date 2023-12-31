# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/BubbleSort.ts

@testset "chap 03: bubble sort" begin
	arr = copy(array_to_sort)
	bubble_sort!(arr)
	@test all(arr .== [3, 4, 7, 9, 42, 69, 420])
end
