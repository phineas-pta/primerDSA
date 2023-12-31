# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/LinearSearchList.ts

@testset "chap 02: linear search array" begin
	@test linear_search(array_to_search, 69)
	@test !linear_search(array_to_search, 1336)
	@test linear_search(array_to_search, 69420)
	@test !linear_search(array_to_search, 69421)
	@test linear_search(array_to_search, 1)
	@test !linear_search(array_to_search, 0)
end
