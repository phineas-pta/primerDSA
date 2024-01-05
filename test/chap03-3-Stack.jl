# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/Stack.ts

@testset "chap 03: stack" begin
	list = Stack{Int}()  # weird error with Integer

	push!(list, 5)
	push!(list, 7)
	push!(list, 9)
	@test pop!(list) == 9
	@test list.length == 2

	push!(list, 11)
	@test pop!(list) == 11
	@test pop!(list) == 7
	@test peek(list) == 5
	@test pop!(list) == 5
	@test list |> pop! |> isnothing
	@test list.length == 0

	push!(list, 69)
	@test peek(list) == 69
	@test list.length == 1
end
