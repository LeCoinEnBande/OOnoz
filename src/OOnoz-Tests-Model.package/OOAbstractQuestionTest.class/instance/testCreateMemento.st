tests
testCreateMemento
	| copy |
	copy := question createMemento.
	self assert: copy equals: question.
	self deny: copy == question