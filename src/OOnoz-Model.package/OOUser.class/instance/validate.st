validation
validate
	self flag: #todo.	"Do better check with patterns."
	self firstName isEmptyOrNil
		ifTrue: [ self invalidate: 'Le prénom doit être renseigné.' ].
	self lastName isEmptyOrNil
		ifTrue: [ self invalidate: 'Le nom doit être renseigné.' ].
	self mail isEmptyOrNil
		ifTrue: [ self invalidate: 'L''email doit être renseigné.' ].
	self password isEmptyOrNil
		ifTrue: [ self invalidate: 'Les mots de passes doivent être valides renseignés.' ].