CLASS GardenRegion EXTENDS Object MODULE AocApp CLASSVARS ''
	VARS 'plantType area perimeter'

CLASSMETHODS

new: plantType
	^ self new plantType: plantType.
!

METHODS

constructor
	area := 0.
	perimeter := 0.
!
plantType
	^ plantType.
!
plantType: aPlantType
	plantType := aPlantType.
!
perimeter
	^ perimeter.
!
area
	^ area.
!
addPerimeter: aPerimeter
	area := area + 1.
	perimeter := perimeter + aPerimeter.
!
fenceCost
	^ perimeter * area.
!
toString
	^ 'Region: Type: ', plantType toString, ', area: ', area toString, ', perimeter: ', perimeter toString.
!
