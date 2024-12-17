CLASS Day12 EXTENDS DayAbstract MODULE AocApp CLASSVARS ''
	VARS 'garden regions directions'

"
Each garden plot is a square and so has four sides.
The perimeter of a region is the number of sides of garden plots in the region
that do not touch another garden plot in the same region.
Note: Perimiter fences are not shared!

Plants of the same type can appear in multiple separate regions,
and regions can even appear within other regions.

The price of fence required for a region is found by
multiplying that region's area by its perimeter.
The total price of fencing all regions on a map is found by
adding together the price of fence for every region on the map.
"

title
	^ 'Day 12: Garden Groups'.
!
solve
	garden := Garden input.
	regions := #().
	directions := #( ( 1 @ 0 ) ( 0 @ 1 ) ( -1 @ 0 ) ( 0 @ -1 ) ).

	self fenceRegions.

	solution := 0.
	regions do: [ :region |
		solution := solution + region fenceCost ].
!
fenceRegions
	| point plot region |
	0 to: garden height - 1 do: [ :y |
		0 to: garden width - 1 do: [ :x |
			point := x @ y.
			plot := garden at: point.
			plot visited ifFalse: [
				region := GardenRegion new: plot plantType.
				self fenceRegion: region at: point.
				regions add: region ] ] ].
!
fenceRegion: region at: point
	"Find the region of neigboring plots with the same plant type,
	 adding perimeter fence counts needed for each plot."
	| plot perimeter neighbor |

	"Check if point is within garden bounds."
	( garden hasPoint: point ) ifFalse: [ ^ self ].

	plot := garden at: point.
	"Plant type of plot must be same as region."
	plot plantType = region plantType ifFalse: [ ^ self ].
	"Return if plot already visited."
	plot visited ifTrue: [ ^ self ].
	plot visited: true.

	"Perimeters added on sides that are at outside of garden
	 or do not border the same plant type."
	perimeter := 0.
	directions do: [ :direction |
		neighbor := point + direction.
		( ( garden hasPoint: neighbor ) not or: [
			( garden at: neighbor ) plantType ~= region plantType ] ) ifTrue: [
				perimeter := perimeter + 1 ] ].
	region addPerimeter: perimeter.

	"Try fence neighboring plots."
	directions do: [ :direction |
		self fenceRegion: region at: point + direction ].
!
