"
I am the class which represent a user.
"
Class {
	#name : #OOUser,
	#superclass : #OOObject,
	#instVars : [
		'firstName',
		'lastName',
		'mail',
		'password',
		'birthday',
		'gender',
		'hasAvatar',
		'mcqs',
		'isActivated',
		'country',
		'state',
		'city',
		'zip',
		'address',
		'role',
		'credits'
	],
	#category : 'OOnoz-Model-Core'
}

{ #category : #voyage }
OOUser class >> isVoyageRoot [
	^ true
]

{ #category : #voyage }
OOUser class >> mongoRole [
	<mongoDescription>
	^ VOToOneDescription new
		attributeName: 'role';
		accessor: (MAPluggableAccessor read: [ :user | user role mongoDescription ] write: [ :user :string | user role: (OOAbstractRole roleFrom: string) ]);
		yourself
]

{ #category : #accessing }
OOUser class >> possibleGenders [
	^ #(#male #female #other)
]

{ #category : #comparing }
OOUser >> = anObject [
	^ self species = anObject species and: [ self mail = anObject mail ]
]

{ #category : #activation }
OOUser >> activate [
	self isActivated: true
]

{ #category : #adding }
OOUser >> addCredits: anInteger [
	self assert: anInteger >= 0.
	self credits: self credits + anInteger
]

{ #category : #adding }
OOUser >> addMCQ: aMCQ [
	self mcqs add: aMCQ
]

{ #category : #accessing }
OOUser >> address [
	^ address
]

{ #category : #accessing }
OOUser >> address: anObject [
	address := anObject
]

{ #category : #accessing }
OOUser >> beFemale [
	self gender: #female
]

{ #category : #accessing }
OOUser >> beMale [
	self gender: #male
]

{ #category : #accessing }
OOUser >> beOtherGender [
	self gender: #other
]

{ #category : #accessing }
OOUser >> birthday [
	^ birthday
]

{ #category : #accessing }
OOUser >> birthday: anObject [
	birthday := anObject
]

{ #category : #testing }
OOUser >> can [
	^ self role
]

{ #category : #testing }
OOUser >> checkDisponibility [
	(self class selectOne: [ :user | user mail = self mail ])
		ifNotNil: [ :arg | (OOUnavailableUser modelObject: self reason: 'Cet email est déjà utilisé par un autre utilisateur.') signal ]
]

{ #category : #accessing }
OOUser >> cipher: aString [
	self mail ifNil: [ ^ self error: 'The mail is needed to set the passowrd.' ].
	aString ifNil: [ ^ nil ].
	^ (SHA256
		hashMessage:
			(String
				streamContents: [ :s | 
					s
						<< 'Furry';
						<< aString;
						<< (self mail copyUpTo: $@) ])) hex
]

{ #category : #accessing }
OOUser >> city [
	^ city
]

{ #category : #accessing }
OOUser >> city: anObject [
	city := anObject
]

{ #category : #accessing }
OOUser >> country [
	^ country
]

{ #category : #accessing }
OOUser >> country: anObject [
	country := anObject
]

{ #category : #momento }
OOUser >> createMemento [
	"I am used for the memento pattern. My goal is to save my current state in a memento of me."

	^ self copy
]

{ #category : #accessing }
OOUser >> credits [
	^ credits ifNil: [ credits := 5 ]
]

{ #category : #accessing }
OOUser >> credits: anObject [
	credits := anObject
]

{ #category : #accessing }
OOUser >> desactivate [
	self isActivated: false
]

{ #category : #private }
OOUser >> directMail: aString [ 
	"I should be use with care! I allow to change the mail but the mail is used for internal purposes."
	
	mail := aString
]

{ #category : #private }
OOUser >> directPassword: aString [
	"I should be use with care! I set directly a password without ciphering it!"

	password := aString
]

{ #category : #accessing }
OOUser >> firstName [
	^ firstName
]

{ #category : #accessing }
OOUser >> firstName: anObject [
	firstName := anObject
]

{ #category : #accessing }
OOUser >> gender [
	^ gender
]

{ #category : #accessing }
OOUser >> gender: anObject [
	gender := anObject
]

{ #category : #accessing }
OOUser >> hasAvatar [
	^ hasAvatar
]

{ #category : #accessing }
OOUser >> hasAvatar: aBoolean [
	hasAvatar := aBoolean
]

{ #category : #comparing }
OOUser >> hash [
	^ (self species hash + self mail hash) hashMultiply
]

{ #category : #initialization }
OOUser >> initialize [
	super initialize.
	self mcqs: OrderedCollection new.
	self hasAvatar: false.
	self beOtherGender.
	self desactivate.
	self role: OOPlayerRole
]

{ #category : #'error handing' }
OOUser >> invalidate: aString [
	(OOInvalidUser modelObject: self reason: aString) signal
]

{ #category : #accessing }
OOUser >> isActivated [
	^ isActivated
]

{ #category : #accessing }
OOUser >> isActivated: anObject [
	isActivated := anObject
]

{ #category : #testing }
OOUser >> isAdmin [
	^ self role isAdmin
]

{ #category : #testing }
OOUser >> isUser [
	^ true
]

{ #category : #accessing }
OOUser >> lastName [
	^ lastName
]

{ #category : #accessing }
OOUser >> lastName: anObject [
	lastName := anObject
]

{ #category : #accessing }
OOUser >> mail [
	^ mail
]

{ #category : #accessing }
OOUser >> mail: aString [
	mail ifNotNil: [ ^ self error: 'A user should not change his mail because it is used to make some things irreversibles.' ].
	mail := aString
]

{ #category : #accessing }
OOUser >> mcqs [
	^ mcqs
]

{ #category : #accessing }
OOUser >> mcqs: anObject [
	mcqs := anObject
]

{ #category : #accessing }
OOUser >> password [
	^ password
]

{ #category : #accessing }
OOUser >> password: aString [
	password := self cipher: aString
]

{ #category : #testing }
OOUser >> passwordMatch: aString [
	^ self password = (self cipher: aString)
]

{ #category : #copying }
OOUser >> postCopy [
	super postCopy.
	self mcqs: (self mcqs collect: #copy)
]

{ #category : #printing }
OOUser >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $[;
		<< (self firstName ifNil: [ 'No name' ]);
		space;
		<< (self lastName ifNil: [ 'No surname' ]);
		<< $];
		<< $(;
		<< self role asString third;
		<< $)
]

{ #category : #removing }
OOUser >> removeMCQAndSave: aMCQ [
	self mcqs remove: aMCQ.
	aMCQ remove.
	self save
]

{ #category : #momento }
OOUser >> restoreFromMemento: aMemento [
	"I am used for the memento pattern. My goal is to set my state to the set of the memento.
	I let the questions manage their own memento."

	self firstName: aMemento firstName.
	self lastName: aMemento lastName.
	self directMail: aMemento mail.
	self isActivated: aMemento isActivated.
	self birthday: aMemento birthday.
	self gender: aMemento gender.
	self country: aMemento country.
	self state: aMemento state.
	self zip: aMemento zip.
	self address: aMemento address.
	self city: aMemento city
]

{ #category : #accessing }
OOUser >> role [
	^ role ifNil: [ role := OOAdminRole ]
]

{ #category : #accessing }
OOUser >> role: anObject [
	role := anObject
]

{ #category : #accessing }
OOUser >> state [
	^ state
]

{ #category : #accessing }
OOUser >> state: anObject [
	state := anObject
]

{ #category : #'development support' }
OOUser >> validate [
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
		ifTrue: [ self invalidate: 'L''adresse doit être renseigné.' ]
]

{ #category : #accessing }
OOUser >> zip [
	^ zip
]

{ #category : #accessing }
OOUser >> zip: anObject [
	zip := anObject
]
