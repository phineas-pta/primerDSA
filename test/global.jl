"""objects re-used in tests"""

const array_to_search = [1, 3, 4, 69, 71, 81, 90, 99, 420, 1337, 69420]
const array_to_sort = [9, 3, 7, 4, 69, 420, 42]

const my_binary_tree = NodeBT(
	value=20,
	right=NodeBT(
		value=50,
		right=NodeBT(value=100),
		left=NodeBT(value=30, right=NodeBT(value=45), left=NodeBT(value=29))
	),
	left=NodeBT(
		value=10,
		right=NodeBT(value=15),
		left=NodeBT(value=5, right=NodeBT(value=7))
	)
)
