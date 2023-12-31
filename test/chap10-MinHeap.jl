# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/MinHeap.ts

@testset "chap 10: min heap" begin
	heap = MinHeap{Int}()
	@test heap.length == 0

	insert!(heap, 5)
	insert!(heap, 3)
	insert!(heap, 69)
	insert!(heap, 420)
	insert!(heap, 4)
	insert!(heap, 1)
	insert!(heap, 8)
	insert!(heap, 7)

	@test heap.length == 8
	@test pop!(heap) == 1
	@test pop!(heap) == 3
	@test pop!(heap) == 4
	@test pop!(heap) == 5
	@test heap.length == 4
	@test pop!(heap) == 7
	@test pop!(heap) == 8
	@test pop!(heap) == 69
	@test pop!(heap) == 420
	@test heap.length == 0
end
