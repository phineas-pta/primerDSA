# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/LinearSearchList.ts

@testset "chap 02: linear search array" begin
	foo = [1, 3, 4, 69, 71, 81, 90, 99, 420, 1337, 69420]
	@test linear_search(foo, 69)
	@test !linear_search(foo, 1336)
	@test linear_search(foo, 69420)
	@test !linear_search(foo, 69421)
	@test linear_search(foo, 1)
	@test !linear_search(foo, 0)
end
