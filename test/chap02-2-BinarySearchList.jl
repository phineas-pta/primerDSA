# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/BinarySearchList.ts

@testset "chap 02: binary search array" begin
	foo = [1, 3, 4, 69, 71, 81, 90, 99, 420, 1337, 69420]
	@test bs_list(foo, 69)
	@test !bs_list(foo, 1336)
	@test bs_list(foo, 69420)
	@test !bs_list(foo, 69421)
	@test bs_list(foo, 1)
	@test !bs_list(foo, 0)
end
