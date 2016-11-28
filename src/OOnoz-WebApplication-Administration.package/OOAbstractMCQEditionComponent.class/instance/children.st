hooks
children
	| res |
	res := OrderedCollection withAll: self questionComponents.
	res add: self challengeComponent.
	^ res asArray