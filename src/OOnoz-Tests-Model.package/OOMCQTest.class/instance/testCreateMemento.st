tests
testCreateMemento
	| copy |
	copy := mcq createMemento.
	self assert: copy equals: mcq.
	self deny: copy == mcq