# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/Stack.ts

@testset "chap 03: stack" begin
	list = Stack{Int}()  # weird error with Integer

	pushh!(list, 5)
	pushh!(list, 7)
	pushh!(list, 9)
	@test popp!(list) == 9
	@test list.length == 2

	pushh!(list, 11)
	@test popp!(list) == 11
	@test popp!(list) == 7
	@test peekk(list) == 5
	@test popp!(list) == 5
	@test isnothing(popp!(list))
	@test list.length == 0

	pushh!(list, 69)
	@test peekk(list) == 69
	@test list.length == 1
end
