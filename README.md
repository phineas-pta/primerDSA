# primerDSA

Julia implementation of “The Last Algorithms Course You’ll Need” by ThePrimeagen

that is to say: DSA (Data Structures & Algorithms) primer in Julia

folder `src`:
- course materials: https://frontendmasters.com/courses/algorithms/
- answer sheet: https://github.com/rsHalford/the-last-algorithms-course-youll-ever-need

folder `test`:
- unit testing: https://github.com/ThePrimeagen/kata-machine/tree/master/src/%5F%5Ftests%5F%5F<!-- to properly escape double underscore -->
- be careful with array index as JavaScript is 0-based meanwhile Julia is 1-based

why Julia ? it’s high-level enough to write easily like Python but much faster, without resorting to low-level C++ or worse Java headache

require Julia version ≥ 1.9

chapters: (my personal numbering)
- [x] chap 00 (no code): intro
- [x] chap 01 (code without unit test): big 𝒪 notation, array data structure
- [x] chap 02: linear search, binary search, 2 crystal balls
- [x] chap 03: bubble sort, linked list, queue, stack
- [x] chap 04 (no code): array list, array buffer
- [x] chap 05: recursion, path finding
- [x] chap 06: quick sort
- [x] chap 07: doubly linked list
- [x] chap 08: binary trees, tree traversal
- [x] chap 09: compare trees, tree search: breadth-1st, depth-1st
- [x] chap 10: heap, tries
- [x] chap 11: graphs, adjacency matrix, Dijkstra’s shortest path
- [x] chap 12: maps, LRU cache
- [x] chap 13 (no code): wrapped up

## basic Julia setup

1st setup
```
julia> # press ] (without Enter)

(@v1.9) pkg> generate primerDSA
  Generating  project primerDSA:
    primerDSA/Project.toml
    primerDSA/src/primerDSA.jl

(@v1.9) pkg> # press Baskspace (without Enter)

julia> cd("primerDSA"); mkpath("test"); write("test/runtests.jl", """println("Testing...")""");

julia> # press ] (without Enter)

(@v1.9) pkg> activate ./test
  Activating project at `███/primerDSA/test`

(test) pkg> add Test
   Resolving package versions...
    Updating `███/primerDSA/test/Project.toml`
  [████████] + Test
    Updating `███/primerDSA/test/Manifest.toml`
  [████████] + Base64
  [████████] + InteractiveUtils
  [████████] + Logging
  [████████] + Markdown
  [████████] + Random
  [████████] + SHA
  [████████] + Serialization
  [████████] + Test
```
for each time testing
```
julia> # press ] (without Enter)

(@v1.9) pkg> activate ./primerDSA

(primerDSA) pkg> test
```
