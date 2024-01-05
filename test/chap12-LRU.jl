# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/LRU.ts

@testset "chap 12: LRU" begin
	lru = LRU{Integer}(capacity=3)
	@test get!(lru, "foo") |> isnothing

	update!(lru, "foo", 69)
	@test get!(lru, "foo") == 69

	update!(lru, "bar", 420)
	@test get!(lru, "bar") == 420

	update!(lru, "baz", 1337)
	@test get!(lru, "baz") == 1337

	update!(lru, "ball", 69420)
	@test get!(lru, "ball") == 69420

	@test get!(lru, "foo") |> isnothing
	@test get!(lru, "bar") == 420

	update!(lru, "foo", 69)
	@test get!(lru, "bar") == 420
	@test get!(lru, "foo") == 69
	@test get!(lru, "baz") |> isnothing
end
