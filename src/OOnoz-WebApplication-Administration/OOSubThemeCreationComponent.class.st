Class {
	#name : #OOSubThemeCreationComponent,
	#superclass : #OOAbstractSubThemeEditionComponent,
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #hooks }
OOSubThemeCreationComponent >> breadcrumpSubLabel [
	^ #Nouveau
]

{ #category : #initialization }
OOSubThemeCreationComponent >> initialize [
	super initialize.
	self subTheme: OOSubTheme new
]

{ #category : #actions }
OOSubThemeCreationComponent >> save [
	[ self checkValidity.
	self subTheme theme addSubTheme: self subTheme.
	self subTheme theme save.
	self answer: true ]
		on: OOInvalidSubTheme , OOUnavailableSubTheme
		do: [ :e | self hasBeenValidated: true ]
]

{ #category : #accessing }
OOSubThemeCreationComponent >> title [
	^ 'Créer un sous thème'
]
