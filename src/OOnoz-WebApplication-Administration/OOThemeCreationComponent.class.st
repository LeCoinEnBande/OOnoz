Class {
	#name : #OOThemeCreationComponent,
	#superclass : #OOAbstractThemeEditionComponent,
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #hooks }
OOThemeCreationComponent >> breadcrumpSubLabel [
	^ #Nouveau
]

{ #category : #initialization }
OOThemeCreationComponent >> initialize [
	super initialize.
	self theme: OOTheme new
]

{ #category : #action }
OOThemeCreationComponent >> save [
	[ self checkValidity.
	self theme save.
	self answer: true ]
		on: OOInvalidTheme , OOUnavailableTheme , OOInvalidSubTheme , OOUnavailableSubTheme
		do: [ :e | self hasBeenValidated: true ]
]

{ #category : #accessing }
OOThemeCreationComponent >> title [
	^ 'Créer un thème'
]
