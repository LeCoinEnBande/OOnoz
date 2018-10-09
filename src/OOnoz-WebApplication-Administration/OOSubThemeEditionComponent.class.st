Class {
	#name : #OOSubThemeEditionComponent,
	#superclass : #OOAbstractSubThemeEditionComponent,
	#instVars : [
		'memento'
	],
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #'instance creation' }
OOSubThemeEditionComponent class >> subTheme: aSubTheme [
	^ self new
		subTheme: aSubTheme;
		yourself
]

{ #category : #hooks }
OOSubThemeEditionComponent >> breadcrumpSubLabel [
	^ #Éditer
]

{ #category : #actions }
OOSubThemeEditionComponent >> cancel [
	self subTheme restoreFromMemento: self memento.
	super cancel
]

{ #category : #accessing }
OOSubThemeEditionComponent >> memento [
	^ memento
]

{ #category : #accessing }
OOSubThemeEditionComponent >> memento: anObject [
	memento := anObject
]

{ #category : #actions }
OOSubThemeEditionComponent >> save [
	[ self checkValidity.
	self subTheme theme addSubTheme: self subTheme.
	self subTheme theme save.
	self answer: true ]
		on: OOInvalidSubTheme , OOUnavailableSubTheme
		do: [ :e | self hasBeenValidated: true ]
]

{ #category : #accessing }
OOSubThemeEditionComponent >> subTheme: aSubTheme [
	super subTheme: aSubTheme.
	self memento: self subTheme createMemento
]

{ #category : #accessing }
OOSubThemeEditionComponent >> title [
	^ 'Modification du sous thème : ', self subTheme title
]
