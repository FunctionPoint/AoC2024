CLASS DayAbstract EXTENDS Object MODULE AocApp CLASSVARS '' VARS 'result time'

"Solving"

solveTimed
	| start |

	start := Date new toMilliseconds.
	result := self solve.
	time := Date new toMilliseconds - start.
!
title
	self error: 'DayAbstract: Subclass should overload method: title.'
!
solve
	self error: 'DayAbstract: Subclass should overload method: solve.'
!

"Accessing"

result
	^ result.
!
time
	^ time.
!
