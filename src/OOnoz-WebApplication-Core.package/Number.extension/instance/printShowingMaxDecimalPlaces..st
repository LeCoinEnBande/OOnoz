*OOnoz-WebApplication-Core
printShowingMaxDecimalPlaces: placesDesired
	| result |
	result := self printShowingDecimalPlaces: placesDesired.
	[ (result includes: $.) and: [ {$0 . $.} includes: result last ] ]
		whileTrue: [ result := result allButLast ].
	^ result