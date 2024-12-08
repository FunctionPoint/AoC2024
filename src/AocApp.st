CLASS AocApp EXTENDS Object MODULE AocApp CLASSVARS '' VARS 'days'

start
	self initializeDays.

	"Uncomment this to run only a specific day:"
	"^ self runDay: days last."

	self testMode
		ifTrue: [ TestDays. Test all ]
		ifFalse: [ self runAll ].
!
initializeDays
	days := Array new.
	self dayClasses do: [ :dayClass |
		days add: dayClass new ].
!
testMode
	^ ( Process argv length = 3 ) & ( Process argv last = '-test').
!
dayClasses
	"Array of classes of day solutions implemented."
	^ #( Day1 Day2 Day3 Day4 Day5 Day6 ).
!
runAll
	days do: [ :day |
		self runDay: day ].
!
runDay: day
	day solveTimed.
	self log: day title, ': Time: ', day time toString, ', Solution: ', day solution toString.
!
