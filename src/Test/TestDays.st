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
