tests
testCreateMomento
	| memento |
	memento := user createMemento.
	self assert: memento equals: user.
	user directMail: 'test'.
	self deny: memento = user