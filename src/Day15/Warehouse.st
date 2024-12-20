CLASS Warehouse EXTENDS Object MODULE AocApp CLASSVARS ''
	VARS 'positions width height robotPosition'

"Positions is 2D array (array of row arrays).
 At every position there's Character object indicating its occupancy."

METHODS

at: point
	"Returns occupance character at point position."
	^ ( positions at: point y ) at: point x.
!
at: point put: occupance
	^ ( positions at: point y ) at: point x put: occupance.
!
hasPoint: point
	^ ( point x >= 0 ) & ( point x < width ) &
		( point y >= 0 ) & ( point y < height ).
!
load: positionData
	"Creates a 2D garden with a position array element at every point."
	| positionRow |

	positions := #().
	positionData do: [ :positionDataRow |
		positionRow := #().
		positionDataRow do: [ :occupance |
			positionRow add: occupance.
			occupance = $@ ifTrue: [
				robotPosition := positionRow length - 1 @ positions length ] ].
		positions add: positionRow ].

	width := positions first length.
	height := positions length.
!
toString
	| string |
	string := ''.

	self positions do: [ :positionRow |
		positionRow do: [ :occupance |
			string := string , occupance toString ].
		string := string , String newline ].

	^ string.
!
moveRobot: move
	| direction |
	direction := 0 @ 0.
	move = $^ ifTrue: [ direction y: -1 ].
	move = $v ifTrue: [ direction y: 1 ].
	move = $< ifTrue: [ direction x: -1 ].
	move = $> ifTrue: [ direction x: 1 ].

	self move: robotPosition direction: direction.
!
move: position direction: direction
	| newPosition newOccupance occupance |
	newPosition := position + direction.
	newOccupance := self at: newPosition.

	newOccupance = $# ifTrue: [ ^ false ].
	newOccupance = $O ifTrue: [
		"We encountered a box. Try to move it recursively in the same direction."
		( self move: newPosition direction: direction ) ifFalse: [ ^ false ].
		newOccupance := $. ]. "Position will be freed now."
	newOccupance = $. ifTrue: [
		occupance := self at: position.
		self at: newPosition put: occupance.
		self at: position put: $. .
		occupance = $@ ifTrue: [ robotPosition := newPosition ].
		^ true. ].

	self error: 'Illegal occupance'.
!
sumBoxCoordinates
	| sum |
	sum := 0.
	0 to: height - 1 do: [ :y |
		0 to: width - 1 do: [ :x |
			( self at: ( x @ y ) ) = $O ifTrue: [
				sum := sum + ( y * 100 ) + x. ] ] ].
	^ sum.
!

CLASSMETHODS

example1
	"The solution for this is: 2028"

	^ self new load:
	#(
		'########'
		'#..O.O.#'
		'##@.O..#'
		'#...O..#'
		'#.#.O..#'
		'#...O..#'
		'#......#'
		'########'
	).
!

example2
	"The solution for this is: 10092"

	^ self new load:
	#(
		'##########'
		'#..O..O.O#'
		'#......O.#'
		'#.OO..O.O#'
		'#..O@..O.#'
		'#O#..O...#'
		'#O..O..O.#'
		'#.OO.O.OO#'
		'#....O...#'
		'##########'
	).
!

input
	^ self new load:
	#(
		'##################################################'
		'#.#.#......O....##.#O.##..O.........O........O.#.#'
		'#......O..........O..O.O.....O.........#O.......O#'
		'#.OO....#.O.O.OO#....#.OO.....O.##....O.......O.O#'
		'#..........O...#O#.......#OO....O.O..O#........OO#'
		'#O..O.....O..O..#.O.O...O..#.O.O.....O.#....OOO..#'
		'#O#O..O..O.OO.#..O...........#.......#O.OO.O.O..##'
		'#.O..OO.O.#.#.......O......O..........O.O..#.....#'
		'#...O..O..O...OO....O....O....#.OO.#..O.....O..###'
		'###.#.O..O.O.O..O.....O.O.#.....O.O......OO....#O#'
		'#....O.....OO.O#..#..O.O...OO..................#O#'
		'#....OO...O.O.OO.O#.O...O..#..O.#.#....O.O.O.OO.##'
		'##.##....O#O.......O#..O.OOO....O.....O....O#..O.#'
		'#...O..O....#O...O..O.OO..OOO.##O...........O.#O.#'
		'#..O....O.#O...OO....OO.O..O.#OO..O....O.....O...#'
		'#O#O..O.......OO...#.....O#OOO....#.O...O.......O#'
		'#O.O.....OO#.#.O..........#..O#.....O..O#...O..###'
		'#...#.....O#..O....##OO.O.#.#......O......OOO..O.#'
		'#OO.O....O.OO..O.........OO.O.....#.O.O...O..O#O.#'
		'#..O#..O#.OO.OOOO..O..O.......#O#..OO...OO.O....O#'
		'#O.#O#....#..O.#..O#O.OO..O.O.#....#.OOO...O.....#'
		'#.......#..OOOOO...O..OOO..O...O.OO....OO.OOOO...#'
		'#...O..#..OO..OOO.O.#O.#..#.O..O...O#.....O.....O#'
		'#.OOOO.....OOOOO...OO........O#....O.....O.#...#.#'
		'#O#OO.#O..........O..OOO@.O.....O.....#O...O..OOO#'
		'#.#............OO....O......O#O..#O..O.O.........#'
		'#.O.O.....O....O.O.OO.O..O...#........OO.#O....O.#'
		'#......OOOO......O#.#.O...#O.O.OO..O.O...O.O...OO#'
		'#OO#.#O..O...#.O..O.....O...OO.O.....##.O.....O..#'
		'#..#O.#OO.OOO..OOO.#..OO..#.O...OOO......#......##'
		'#O.O#.O..O.......O..OO....#....O..O..O....O...#..#'
		'#..OO.O...............##O..O..OO....O.OO...O...OO#'
		'#.#O........O...O.O....#O#........O.....#..#O....#'
		'#......#....O#......#.#.#...#........O..OOO..O..O#'
		'#O.#OO.##..........O.#O.O.#O.#OO#....O..OO...OO..#'
		'#...OO.......#...##..#......O.O.OO.OOOO.O.#.#....#'
		'##.O..#..O#......OO.....#....O..#..O..O.#.OO..#..#'
		'#....O.OOO.O..O#........O.O...OO...O...O.O....O..#'
		'#OOOO.OO...O.O..#O.OO.O#......#OO..O.O.....O..O..#'
		'#..#.O..O..#O......O...OO.......#O...#..#O#.O..O.#'
		'#O...#..OOO.O#O.O.O.O.O..O...O.O#..O..O..O.#..OO.#'
		'#.....O.O.O..O.O..OO.........#O.....O...O......O.#'
		'#O...OOO....O.OO..#....O#O...O.O..O.O.......OOO.O#'
		'#OO#..O##..O...O.#..O....##..OOO...O.O##.##..#.OO#'
		'#OO.......O##.#..O.OO......O..O..O..O....O.O...O.#'
		'#.....O...O.O.#..O..O.#..O.OOO#.......#.........##'
		'#..O.O.OO....#...OOO.OO..O....O.#.O.O##....OOO...#'
		'#OO#O..#.....O.....O.....O...O#O..O..O#......O#..#'
		'#O....#.OOO.O#.OO..O...OOO.OOOO...OO#O.O.O.....OO#'
		'##################################################'
	).
!
