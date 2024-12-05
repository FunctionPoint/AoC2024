CLASS DayAbstract EXTENDS Object MODULE AocApp CLASSVARS '' VARS 'solution time'

"Solving"

solveTimed
	| start |

	start := Date new toMilliseconds.
	self solve.
	time := Date new toMilliseconds - start.
!
title
	self error: 'DayAbstract: Subclass should overload method: title.'
!
solve
	self error: 'DayAbstract: Subclass should overload method: solve.'
!

"Accessing"

solution
	^ solution.
!
time
	^ time.
!
