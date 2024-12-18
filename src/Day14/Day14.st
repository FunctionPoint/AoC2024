CLASS Day14 EXTENDS DayAbstract MODULE AocApp CLASSVARS ''
	VARS 'gridSize robots'

"https://adventofcode.com/2024/day/14"

title
	^ 'Day 14: Restroom Redoubt'.
!
solve
	gridSize := self gridSize.
	robots := Robot load: Robot configurations.

	100 timesRepeat: [
		self moveRobots ].

	solution := self gridSafety.
!
logRobots
	self log: 'Robot list:'.
	robots do: [ :robot |
		self log: robot toString ].
!
moveRobots
	robots do: [ :robot |
		robot move: gridSize ].
!
gridSafety
	| quadrants quadrant |
	quadrants := #( 0 0 0 0 ).

	robots do: [ :robot |
		quadrant := robot quadrant: gridSize.
		quadrant notNil ifTrue: [
			( quadrants at: quadrant ) increment ] ].

	^ quadrants reduce: [ :quadrant1 :quadrant2 | quadrant1 * quadrant2 ].
!
exampleGridSize
	^ 11 @ 7.
!
gridSize
	^ 101 @ 103.
!
