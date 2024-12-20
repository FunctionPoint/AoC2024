CLASS TestDays EXTENDS Test MODULE TestAocApp CLASSVARS '' VARS 'aocApp'

test
	| day1 |

	day1 := Day1 new solveTimed.
	self assert: [ day1 title startsWith: 'Day' ].
	self assert: [ day1 solution = 2057374 ].
	self assert: [ day1 time >= 0 ].

	self assert: [ Day2 new solve solution = 524 ].
	self assert: [ Day3 new solve solution = 184122457 ].
	self assert: [ Day4 new solve solution = 2483 ].
	self assert: [ Day5 new solve solution = 6949 ].
	self assert: [ Day6 new solve solution = 5131 ].
	self assert: [ Day7 new solve solution = 975671981569 ].
	self assert: [ Day8 new solve solution = 318 ].
	self assert: [ Day9 new solve solution = 6378826667552 ].
	self assert: [ Day10 new solve solution = 548 ].
	self assert: [ Day11 new solve solution = 220999 ].
	self assert: [ Day12 new solve solution = 1415378 ].
	self assert: [ Day13 new solve solution = 28262 ].
	self assert: [ Day14 new solve solution = 231019008 ].
	self assert: [ Day15 new solve solution = 1559280 ].
!
