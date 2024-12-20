# Advent of Code 2024

Implements Advent of Code puzzles of year 2024.
The solutions are implemented in SmallJS,
a Smalltalk dialect that compiles to JavaScript.
See: [http://small-js.org](http://small-js.org).
The resulting application runs in Node.js.
(Running in a browser is not useful for these types of problems.)

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
Because that is wat SmallJS is built on :-).

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

Per antenna type, the different locations are first stored in a key-value map.
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

### Day 11: Plutonian Pebbles

Very straightforward implementation of the blink rules,
making a new stones list for every operation.

### Day 12: Garden Groups

Felt the need to do proper OO with additional problem classes besides the solution class:
Garden, GardenPlot, GardenRegion.

First the garden is loaded from the data putting a GardenPlot object at every coordinate
that saves the plan type for that plot but also has a variable remembering if the plot has been
'visited' already (was already added to a region).

Then the garden plots are iterated over and for each plot a region with the same plant type
is found by trying all neighbors. Also the number perimeter fences needed is checked per plot,
looking at its neighbors.

Every plot is added to GardenRegion object that remembers its pant type,
its area (number of plots), and the number of perimeter fences needed.

Lastly calculation of the cost is done by iterating over all regions,
multiplying area and perimeter.

### Day 13: Claw Contraption

This one is solved mostly by math.
Buttons A and B have known point (vertex) increments per push
and must each pushed a (separate) number or times to reach the prize point.
Splitting fo x and y this can be seen as 2 equations with 2 unknowns.
These equations can be directly rewritten to solve for pushes of A and B.
If there is no (integer) solution, result will be a fraction.

Then just iterate over the push solutions that are not fractions
and calcalculate total of tokens using the the weight factors for A (=3) and B (=1).

### Day 14: Restroom Redoubt

Quite a straightforward solution with robot behavior encapsulated in a Robot class.
Considered a Grid class too but it did not seem worth it,
because the robots manage most of the state, the grid only maintains its size.
OO is a good fit for this stateful problem.

### Day 15: Warehouse Woes

Straightforward building blocks for solution: Warehouse and RobotMoves.
A Warehouse object remembers the positions of the robot and boxes after moves.
The crux of the solution is when the robot tries to move to the location of a box,
*try* to move that box in the same direction, recursively.

