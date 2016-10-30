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
	self country isEmptyOrNil
		ifTrue: [ self invalidate: 'Le pays doit être renseigné.' ].
	self state isEmptyOrNil
		ifTrue: [ self invalidate: 'La région doit être renseigné.' ].
	self city isEmptyOrNil
		ifTrue: [ self invalidate: 'La ville doit être renseigné.' ].
	self zip isEmptyOrNil
		ifTrue: [ self invalidate: 'Le code postal doit être renseigné.' ].
	self address isEmptyOrNil
		ifTrue: [ self invalidate: 'L''adresse doit être renseigné.' ].
		
