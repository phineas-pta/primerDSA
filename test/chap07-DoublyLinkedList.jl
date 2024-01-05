# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/DoublyLinkedList.ts
# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/ListTest.ts

@testset "chap 07: double linked list" begin
	list = DoublyLinkedList{Int}()  # weird error with Integer

	append!(list, 5)
	append!(list, 7)
	append!(list, 9)
	@test get(list, 3) == 9
	@test removeAt!(list, 2) == 7
	@test list.length == 2

	append!(list, 11)
	@test removeAt!(list, 2) == 9
	@test remove!(list, 9) |> isnothing
	@test removeAt!(list, 1) == 5
	@test removeAt!(list, 1) == 11
	@test list.length == 0

	prepend!(list, 5)
	prepend!(list, 7)
	prepend!(list, 9)

	@test get(list, 3) == 5
	@test get(list, 1) == 9
	@test remove!(list, 9) == 9
	@test list.length == 2
	@test get(list, 1) == 7
end
