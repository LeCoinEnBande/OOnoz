Extension { #name : #OOUser }

{ #category : #'*OOnoz-WebApplication-Core' }
OOUser >> avatarUrlFrom: aConfiguration [
	^ aConfiguration avatarsURL
		,
			(self hasAvatar
				ifFalse: [ 'default.png' ]
				ifTrue: [ self mail , '.png' ])
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOUser >> displayName [
	^ String
		streamContents: [ :s | 
			s
				<< self firstName;
				space;
				<< self lastName ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOUser class >> genders [
	| dico |
	dico := Dictionary new.
	self possibleGenders do: [ :each | dico at: each put: #Indefinit ].
	dico at: #male put: #Homme.
	dico at: #female put: #Femme.
	dico at: #other put: #Autre.
	^ dico
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOUser >> isLoggable [
	^ true
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOUser >> isLogged [
	^ true
]
