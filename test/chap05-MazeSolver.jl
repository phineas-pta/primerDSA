# https://github.com/ThePrimeagen/kata-machine/blob/master/src/__tests__/MazeSolver.ts

@testset "chap 05: maze solver" begin
	maze = [
		"xxxxxxxxxx x",
		"x        x x",
		"x        x x",
		"x xxxxxxxx x",
		"x          x",
		"x xxxxxxxxxx",
	]
	start, endd = Pointy(11, 1), Pointy(2, 6)
	mazeResult = [
		start,
		Pointy(11, 2),
		Pointy(11, 3),
		Pointy(11, 4),
		Pointy(11, 5),
		Pointy(10, 5),
		Pointy(9,  5),
		Pointy(8,  5),
		Pointy(7,  5),
		Pointy(6,  5),
		Pointy(5,  5),
		Pointy(4,  5),
		Pointy(3,  5),
		Pointy(2,  5),
		endd,
	]
	result = solve(maze, 'x', start, endd)
	@test all(result .== mazeResult)
end
