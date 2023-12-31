# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/BinarySearchList.ts

@testset "chap 02: binary search array" begin
	@test bs_list(array_to_search, 69)
	@test !bs_list(array_to_search, 1336)
	@test bs_list(array_to_search, 69420)
	@test !bs_list(array_to_search, 69421)
	@test bs_list(array_to_search, 1)
	@test !bs_list(array_to_search, 0)
end
