tests
testRestoreFromMemento
	| copy |
	copy := mcq createMemento.
	mcq title: 'mon super titre'.
	
	self deny: copy = mcq.
	mcq restoreFromMemento: copy.
	
	self assert: copy equals: mcq.
