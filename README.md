# Advent of Code 2024

Implements Advent of Code puzzles of year 2024

## Running

Start the project in VSCode with `F5`.
Or run the bash script: start.sh

## Problems

Note:
I've only implemented part 1 of every day problem for now,
as I can only spare an hour so each day.

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
Of this map all location pairs taken to calculate relative anti-node locations.
Antinode locations are stored in a list, preventing duplicates.
The size of the list is the solution.
