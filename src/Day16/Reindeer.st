CLASS Reindeer EXTENDS Object MODULE AocApp CLASSVARS ''
	VARS 'position direction score'

METHODS

"Creating"

copy
	^ Reindeer new
		position: position;
		direction: direction;
		score: score.
!

"Converting"

toString
	^ 'Reindeer: Position: ', position toString,
		', Direction: ', direction toString,
		', Score: ', score toString.
!

"Accessing"

position
	^ position.
!
position: aPosition
	position := aPosition.
!
direction
	^ direction.
!
direction: aDirection
	direction := aDirection.
!
score
	^ score.
!
score: aScore
	score := aScore.
!

"Moving"

advance
	score := score + 1.
	position := position + direction.
!
turnLeft
	"	1  0  >  0 -1
	v	0 -1  >  -1 0
		-1 0  >  0 1
	v	0 1   >  1 0"
	score := score + 1000.
	direction := direction y @ direction x.
	direction x = 0 ifTrue: [ direction y: direction y negated ].
!
turnRight
	"v	1  0  >  0 1
		0 1   >  -1 0
	v	-1 0  >  0 -1
		0 -1  >  1 0"
	score := score + 1000.
	direction := direction y @ direction x.
	direction y = 0 ifTrue: [ direction x: direction x negated ].
!
