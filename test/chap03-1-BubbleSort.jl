# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/BubbleSort.ts

@testset "chap 03: bubble sort" begin
	arr = [9, 3, 7, 4, 69, 420, 42]
	bubble_sort!(arr)
	@test all(arr .== [3, 4, 7, 9, 42, 69, 420])
end
