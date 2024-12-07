CLASS AocApp EXTENDS Object MODULE AocApp CLASSVARS '' VARS 'days'

start
	self initializeDays.

	"^ self runDay: days last."

	"These test class references are needed to force importing their full unit test modules."
	TestDays.
	Test allThen: [
		self runAll ].
!
initializeDays
	days := Array new.
	self dayClasses do: [ :dayClass |
		days add: dayClass new ].
!
dayClasses
	"Array day solution classes implemented."
	^ #( Day1 Day2 Day3 ).
!
runAll
	days do: [ :day |
		self runDay: day ].
!
runDay: day
	day solveTimed.
	self log: day title, ': Time: ', day time toString, ', Solution: ', day solution toString.
!
