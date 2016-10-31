tests
testRestoreFromMemento
	| memento |
	memento := user createMemento.
	user directMail: 'test'.
	self deny: memento = user.
	user restoreFromMemento: memento.
	self assert: user equals: memento