CLASS AocApp EXTENDS Object MODULE AocApp CLASSVARS '' VARS 'days'

start
	self initializeDays.

	self testMode
		ifTrue: [
				TestDays.
				Test all ]
		ifFalse: [
			self lastMode
				ifTrue: [ ^ self runDay: days last. ]
				ifFalse: [ self runAll ] ].
!
initializeDays
	days := Array new.
	self dayClasses do: [ :dayClass |
		days add: dayClass new ].
!
testMode
	^ ( Process argv length = 3 ) & ( Process argv last = '-test').
!
lastMode
	^ ( Process argv length = 3 ) & ( Process argv last = '-last').
!
dayClasses
	"Array of classes of day solutions implemented."
	^ #( Day1 Day2 Day3 Day4 Day5 Day6 Day7 Day8 Day9 Day10 Day11 Day12
		Day13 Day14 ).
!
runAll
	days do: [ :day |
		self runDay: day ].
!
runDay: day
	day solveTimed.
	self log: day title, ': Time: ', day time toString, ', Solution: ', day solution toString.
!
