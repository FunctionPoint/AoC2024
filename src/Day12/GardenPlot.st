CLASS GardenPlot EXTENDS Object MODULE AocApp CLASSVARS ''
	VARS 'visited plantType'

CLASSMETHODS

new: plantType
	^ self new plantType: plantType.
!

METHODS

constructor
	visited := false.
!
plantType
	^ plantType.
!
plantType: aPlantType
	plantType := aPlantType.
!
visited
	^ visited.
!
visited: aVisited
	visited := aVisited.
!
