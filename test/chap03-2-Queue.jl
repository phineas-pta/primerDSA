# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/Queue.ts

@testset "chap 03: queue" begin
	list = Queue{Int}()

	enqueue!(list, 5)
	enqueue!(list, 7)
	enqueue!(list, 9)
	@test dequeue!(list) == 5
	@test list.length == 2

	enqueue!(list, 11)
	@test dequeue!(list) == 7
	@test dequeue!(list) == 9
	@test peekk(list) == 11
	@test dequeue!(list) == 11
	@test isnothing(dequeue!(list))
	@test list.length == 0

	enqueue!(list, 69)
	@test peekk(list) == 69
	@test list.length == 1
end