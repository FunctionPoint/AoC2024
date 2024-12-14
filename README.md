# Advent of Code 2024

Implements Advent of Code puzzles of year 2024.
The solutions are implemented in SmallJS,
a Smalltalk dialect that compiles to JavaScript.
See: [http://small-js.org](http://small-js.org).
The resulting application runs in Node.js.
(Running in a browser is not usefull for these types of problems.)

I've only implemented part 1 of every day problem for now,
as I can only spare an hour so each day.

The design goal of these implementations is to make them easy to understand.
So verbose variable names and function names,
clarifying variables that may be used only once,
small functions with limited responsibility,
instance variables iso passing around variables a lot.

## Running

Start the project in VSCode with `F5`.
Or run the bash script: start.sh

## Solutions

Per solution, some implementation notes are given.

### Day 1: Historian Hysteria

Simple parallel traversal of 2 lists, sorted first.

### Day 2: Red-Nosed Reports

The 'safe' check per report is implemented with a few if statements.

### Day 3: Mull It Over

Made a full parser, iso using regular expressions to simplify the task.
Because that is wat SmallJS is buit on :-).

### Day 4: Ceres search

Brute force searching XMAS in all directions from all points of the grid.
The Point type of Smalltalk keeps things concise.

### Day 5: Print Queue

A brute force search was fast enough in SmallJS.

### Day 6: Guard Gallivant

Straight forward implementation that runs in very little time.
The 'game state management' of this problem is a natural fit for OOP imo.

### Day 7: Bridge Repair

Encoded the operators '+' and '*' as 0 and 1 bits in an integer operatorBits,
so you can enumerate all operator combinations by just increasing this integer value.

### Day 8: Resonant Collinearity

Per antenna type, the diffent locations are first stored in a key-value map.
Of this map all location pairs are taken to calculate their antinode locations.
Antinode locations are stored in a list, preventing duplicates.
The size of the list is the solution.

### Day 9: Disk Fragmenter

Expand the compressed disk map to a block level disk array with file ID per block
and nil indicating free space.
The find a free block from the left and file block from the right and 'swap' them.
Repeat this until left reaches right.
Then calculate the checksum of the resulting disk as indicated.

### Day 10: Hoof it

The crux is the recursive method 'trailsAt: point height: height'
that first checks if the point is within the map borders.
It then checks if the map point has the desired height.
If height is 9 then we've found a solution, add this endpoint uniquely.
Otherwise recursively call the function with the neighboring points,
(up, down, left or right), and the next desired height (+1).
