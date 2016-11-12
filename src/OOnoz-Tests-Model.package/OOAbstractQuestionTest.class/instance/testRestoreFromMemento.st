tests
testRestoreFromMemento
	| copy |
	copy := question createMemento.
	self assert: copy equals: question.
	question description: 'new desc'.
	self deny: question = copy.
	question restoreFromMemento: copy.
	self assert: copy equals: question