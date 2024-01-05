# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/Queue.ts

@testset "chap 03: queue" begin
	list = Queue{Int}()  # weird error with Integer

	enqueue!(list, 5)
	enqueue!(list, 7)
	enqueue!(list, 9)
	@test dequeue!(list) == 5
	@test list.length == 2

	enqueue!(list, 11)
	@test dequeue!(list) == 7
	@test dequeue!(list) == 9
	@test peek(list) == 11
	@test dequeue!(list) == 11
	@test list |> dequeue! |> isnothing
	@test list.length == 0

	enqueue!(list, 69)
	@test peek(list) == 69
	@test list.length == 1
end
