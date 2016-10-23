action
save
	self flag: #todo.	"Manage the errors."
	self mcq questions: (self questions select: [ :a | a key isNotNil ] thenCollect: [ :asso | asso key answers: (asso value ifNil: [ Set new ] ifNotNil: [ :coll | coll asSet ]) ]) asSet.
	[ self mcq validate.
	self currentUser addMCQ: self mcq.
	self mcq save.
	self currentUser save ]
		on: OOInvalidObject
		do: [ self hasBeenValidated: true ]