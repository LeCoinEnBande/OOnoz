Class {
	#name : #OOThemeEditionComponent,
	#superclass : #OOAbstractThemeEditionComponent,
	#instVars : [
		'memento'
	],
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #accessing }
OOThemeEditionComponent class >> theme: aTheme [
	^ self new
	 	theme: aTheme; 
		yourself
]

{ #category : #hooks }
OOThemeEditionComponent >> breadcrumpSubLabel [
	^ #Éditer
]

{ #category : #hooks }
OOThemeEditionComponent >> cancel [
	self theme restoreFromMemento: self memento.
	super cancel
]

{ #category : #accessing }
OOThemeEditionComponent >> memento [
	^ memento
]

{ #category : #accessing }
OOThemeEditionComponent >> memento: anObject [
	memento := anObject
]

{ #category : #action }
OOThemeEditionComponent >> save [
	self theme save.
	self answer: true
	
]

{ #category : #accessing }
OOThemeEditionComponent >> theme: aTheme [
	super theme: aTheme.
	self memento: self theme createMemento
]

{ #category : #accessing }
OOThemeEditionComponent >> title [
	^ 'Modification du thème : ', self theme title
]
