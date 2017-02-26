tests
testRestoreFromMemento
	| copy |
	copy := instance createMemento.
	instance title: 'mon super titre'.
	self deny: copy = instance.
	instance restoreFromMemento: copy.
	self assert: copy equals: instance