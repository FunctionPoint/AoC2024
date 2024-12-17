CLASS Day13 EXTENDS DayAbstract MODULE AocApp CLASSVARS ''
	VARS 'machines'

"https://adventofcode.com/2024/day/13"

title
	^ 'Day 13: Claw Contraption'.
!
solve
	machines := ClawMachine load: ClawMachine configurations.

	solution := 0.
	machines do: [ :machine |
		"self log: machine."
		solution := solution + machine tokens ].
!
