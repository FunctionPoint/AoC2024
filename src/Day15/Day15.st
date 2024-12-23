CLASS Day15 EXTENDS DayAbstract MODULE AocApp CLASSVARS ''
	VARS 'warehouse moves'

"AoC page: https://adventofcode.com/2024/day/15"

title
	^ 'Day 15: Warehouse Woes'.
!
solve
	warehouse := Warehouse input.
	moves := RobotMoves input.

	moves do: [ :move |
		warehouse moveRobot: move ].

	solution := warehouse sumBoxCoordinates.
!
