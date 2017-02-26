tests
testCreateMemento
	| copy |
	copy := instance createMemento.
	self assert: copy equals: instance.
	self deny: copy == instance.
	instance title: 'Other'.
	self deny: copy = instance