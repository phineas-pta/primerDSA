# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/TwoCrystalBalls.ts

@testset "chap 02: two crystal balls" begin
	N = 10000
	idx = rand(1:N)
	data = [fill(false, idx); fill(true, N-idx)]
	@test two_crystal_balls(data) == idx+1

	@test two_crystal_balls(fill(false, 821)) == -1
end
