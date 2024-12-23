CLASS Day16 EXTENDS DayAbstract MODULE AocApp CLASSVARS ''
	VARS 'maze'

"AoC page: https://adventofcode.com/2024/day/16"

title
	^ 'Day 16: Reindeer Maze'.
!
solve
	| reindeer |

	"maze := Maze input."
	maze := Maze example2.

	solution := maze solve.
!
