CLASS AocApp EXTENDS BrowserApp MODULE AocApp CLASSVARS ''
	VARS 'days daysTable runAllButton'

start
	self initializeDays.
	self bindElements.

	self testMode ifTrue: [
		TestAocApp new test: self ].
!
initializeDays
	days := Array new.
	self dayClasses do: [ :dayClass |
		days add: dayClass new ].
!
dayClasses
	"Array day solution classes implemented."
	^ #( Day1 Day2 ).
!
bindElements
	daysTable := Document getElementById: 'daysTable' class: HtmlTableElement.
	runAllButton := Document getElementById: 'runAllButton' class: HtmlButtonElement.
	runAllButton onClick: [ self runAll ].
!
runAll
	self clearDaysTable.
	self setCursor: 'wait'.
	"Wait 0.1 seconds before starting days
	 to give browser time to update the HTML first."
	Timer timeout: 100 then: [
		self runAll2 ].
!
clearDaysTable
	daysTable tBody innerHtml: ''.
!
setCursor: value
	Document default body style setProperty: 'cursor' value: value.
	runAllButton style setProperty: 'cursor' value: value.
	daysTable style setProperty: 'cursor' value: value.
!
runAll2
	days do: [ :day |
		"Pause shortly between solutions to allow GUI updates."
		Timer timeout: 100 then: [
			day solveTimed.
			self addDay: day ] ].
!
addDay: day
	| row |
	row := daysTable tBody insertRow: -1.

	( row insertCell ) textContent: day title.
	( row insertCell ) textContent: day solution.
	( row insertCell ) textContent: day time toString.

	"Restrore cursor after last day."
	day = days last ifTrue: [
		self setCursor: 'default' ].
!

"Accessing (used by tests)"

days
	^ days.
!
daysTable
	^ daysTable.
!
runAllButton
	^ runAllButton.
!
