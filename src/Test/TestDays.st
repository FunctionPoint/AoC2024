CLASS TestDays EXTENDS Test MODULE TestAocApp CLASSVARS '' VARS 'aocApp'

testDay1
	| day1 |

	day1 := Day1 new.
	self assert: [ day1 title startsWith: 'Day' ].
	self assert: [ day1 list1 length = 1000 ].
	self assert: [ day1 list2 length = 1000 ].

	day1 solveTimed.
	self assert: [ day1 solution = 2057374 ].
	self assert: [ day1 time >= 0 ].
!
testDay2
	| day2 |
	day2 := Day2 new solveTimed.

	self assert: [ day2 title startsWith: 'Day' ].
	self assert: [ day2 reports length = 1000 ].
	self assert: [ day2 solution = 524 ].
!
testDay3
	| day3 |
	day3 := Day3 new solveTimed.

	self assert: [ day3 title startsWith: 'Day' ].
	self assert: [ day3 count = 701 ].
	self assert: [ day3 solution = 184122457 ].
!
testDay4
	| day4 |
	day4 := Day4 new solveTimed.

	self assert: [ day4 title startsWith: 'Day' ].
	self assert: [ day4 solution = 2483 ].
!
testDay5
	self assert: [ Day5 new solve solution = 6949 ].
!
testDay6
	self assert: [ Day6 new solve solution = 5131 ].
!
testDay7
	self assert: [ Day7 new solve solution = 975671981569 ].
!
testDay8
	self assert: [ Day8 new solve solution = 318 ].
!
testDay9
	self assert: [ Day9 new solve solution = 6378826667552 ].
!
testDay10
	self assert: [ Day10 new solve solution = 548 ].
!
testDay11
	self assert: [ Day11 new solve solution = 220999 ].
!
testDay12
	self assert: [ Day12 new solve solution = 1415378 ].
!
testDay13
	self assert: [ Day13 new solve solution = 28262 ].
!
