CLASS TestAocApp EXTENDS Object MODULE TestAocApp CLASSVARS '' VARS 'aocApp'

"Test AocApp units and GUI.
 This class is not a subclass of Test so is not called automatically with Test all."

test: aAocApp
	aocApp := aAocApp.

	Test allThen: [
		self testGui ].
!
testGui
	"Check if days are loaded in days table."
	self assert: [ aocApp daysTable rows length - 1 = aocApp days length ].

	aocApp runAllButton click.
	Timer timeout: 10000 then: [
		self checkResults.
		aocApp stop ].
!
checkResults
	"Check if all aoc results contain numbers."

	aocApp daysTable tBody rows do: [ :row |
		self assert: [ ( row cells at: 1 ) textContent startsWith: 'Day' ].
		self assert: [ ( row cells at: 2 ) textContent length > 0 ].
		self assert: [ ( row cells at: 3 ) textContent toInteger >= 0 ] ].
!
