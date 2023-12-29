# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/DoublyLinkedList.ts
# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/ListTest.ts

@testset "chap 07: double linked list" begin
	list = DoublyLinkedList{Int}()  # weird error with Integer

	appendd!(list, 5)
	appendd!(list, 7)
	appendd!(list, 9)
	@test gett(list, 3) == 9
	@test removeAt!(list, 2) == 7
	@test list.length == 2

	appendd!(list, 11)
	@test_broken removeAt!(list, 2) == 9
	@test_broken isnothing(remove!(list, 9))
	@test removeAt!(list, 1) == 5
	@test_broken removeAt!(list, 1) == 11
	@test list.length == 0

	prependd!(list, 5)
	prependd!(list, 7)
	prependd!(list, 9)

	@test gett(list, 3) == 5
	@test gett(list, 1) == 9
	@test remove!(list, 9) == 9
	@test list.length == 2
	@test_broken gett(list, 1) == 7
end
