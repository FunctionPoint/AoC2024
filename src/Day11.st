CLASS Day11 EXTENDS DayAbstract MODULE AocApp CLASSVARS ''
	VARS 'stones'

"
Every time you blink, the stones each simultaneously change
according to the first applicable rule in this list:

- If the stone is engraved with the number 0,
  it is replaced by a stone engraved with the number 1.
- If the stone is engraved with a number that has an even number of digits, it is replaced by two stones:
  The left half of the digits are engraved on the new left stone,
  the right half of the digits are engraved on the new right stone.
  (The new numbers don't keep extra leading zeroes: 1000 would become stones 10 and 0.)
- If none of the other rules apply, the stone is replaced by a new stone;
  the old stone's number multiplied by 2024 is engraved on the new stone.
"

title
	^ 'Day 11: Plutonian Pebbles'.
!
solve
	stones := self stones.

	25 timesRepeat: [
		self blink ].

	solution := stones length.
!
blink
	| newStones stoneString stoneStringMiddle |

	newStones := #().
	stones do: [ :stone |
		stone = 0
			ifTrue: [
				newStones add: 1 ]
			ifFalse: [
				stoneString := stone toString.
				stoneString length % 2 = 0
					ifTrue: [
						stoneStringMiddle := stoneString length // 2.
						newStones add: ( stoneString substring: 0 to: stoneStringMiddle ) toInteger.
						newStones add: ( stoneString substring: stoneStringMiddle ) toInteger ]
					ifFalse: [
						newStones add: stone * 2024 ] ] ].

	stones := newStones.
!
exampleStones
	"The solution for this is:
		After 1 blink: 253000 1 7
		After 2 blinks: 253 0 2024 1416836"

	^ #( 125 17 ).
!
stones
	^ #( 6 11 33023 4134 564 0 8922422 688775 ).
!
