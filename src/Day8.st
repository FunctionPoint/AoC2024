CLASS Day8 EXTENDS DayAbstract MODULE AocApp CLASSVARS ''
	VARS 'map mapWidth mapHeight antennaLocations antinodes'

"An antinode occurs at any point that is perfectly in line with two antennaLocations of the same frequency,
but only when one of the antennaLocations is twice as far away as the other.

Algorithm:
Per antenna type, the diffent locations are first stored in a key-value map.
Of this map all location pairs taken to calculate relative anti-node locations.
Antinode locations are stored in a list, preventing duplicates.
The size of the list is the solution."

title
	^ 'Day 8: Resonant Collinearity'.
!
solve
	map := self map.
	mapWidth := map first length.
	mapHeight := map length.

	self findAntennaLocations.
	self findAntinodes.

	solution := antinodes length.
!
findAntennaLocations
	| antenna |
	antennaLocations := Map new.

	0 to: mapHeight - 1 do: [ :y |
		0 to: mapWidth - 1 do: [ :x |
			antenna := ( ( map at: y ) at: x ) toString.
			antenna = '.' ifFalse: [
				self saveAntenna: antenna at: x @ y ] ] ].
!
saveAntenna: antenna at: location
	| locations |
	( antennaLocations has: antenna )
		ifTrue: [ locations := antennaLocations get: antenna ]
		ifFalse: [ locations := #(). antennaLocations set: antenna value: locations ].
	locations add: location.
!
findAntinodes
	antinodes := #().

	antennaLocations values do: [ :locations |
		0 to: locations length - 1 do: [ :index1 |
			index1 + 1 to: locations length - 1 do: [ :index2 |
				self findAntinodesFor: ( locations at: index1 ) and: ( locations at: index2 ) ] ] ].
!
findAntinodesFor: location1 and: location2
	| delta |
	delta := location2 - location1.
	self setAntinode: location1 - delta.
	self setAntinode: location2 + delta.
!
setAntinode: location
	( location x >= 0 ) & ( location x < mapWidth ) &
		( location y >= 0 ) & ( location y < mapHeight ) ifTrue: [
			self addAntinode: location ].
!
addAntinode: location
	( antinodes includes: location ) ifFalse: [
		antinodes add: location ].
!
exampleMap
	^ #(
		'............'
		'........0...'
		'.....0......'
		'.......0....'
		'....0.......'
		'......A.....'
		'............'
		'............'
		'........A...'
		'.........A..'
		'............'
		'............'
	).
!
map
	^ #(
		'..........1.............TE........................'
		'....................................R.............'
		'..................................................'
		'.......................j.....Q....................'
		'...................A................8.............'
		'...........................s.......9...........k..'
		'q.E..............6...............1R.w.........k...'
		'..6...E..............1.........R...............t..'
		'.....r.Q......6........Re..T..............9.......'
		'.............................T........9...........'
		'...............................................wv.'
		'.P............A..................8.v....s.k.......'
		'.q..................A......k.........8............'
		'..........o.....1.....W..H............8.......w...'
		'..Q........P.........O.........e...N.W............'
		'P................z.........o.............N.......w'
		'..............o.....p..........Z.s..........N.....'
		'.....O.x......K.....................v..aN.........'
		'..O...............U.....H.......t.................'
		'.E.......q...6.....i..............................'
		'..............z..........o...i...........aW.......'
		'....O........r.............e.....Wt...............'
		'...............U.7i........H......h........t......'
		'......Q.......n..2...I...A....i.p.................'
		'...........2...9n.................s........j......'
		'..q................Ur..........p..................'
		'.............n.................K..................'
		'.....S....z.........I.....H.............e.j.......'
		'..................7..prD..K...d...................'
		'S.........V.....7....K............................'
		'......................................0...........'
		'..................................................'
		'..................2..........I....j.Z.............'
		'....................X.............J..Z....a.......'
		'........SX............................x......0J...'
		'................U....n........x...............0...'
		'.........S......X................x....a...........'
		'...5.......X.......................02.............'
		'...............V.........................d...J....'
		'.............................u.......4............'
		'.....5...........................u.4..............'
		'....5.............................................'
		'......V................................3..........'
		'......D..........................................d'
		'....D.................................4...........'
		'.....h....................................d7......'
		'..............................P...................'
		'.........D......h........3................u...4...'
		'.............h..5.....3...........u.....I.........'
		'..........3......V.............................J..'
	).
!
