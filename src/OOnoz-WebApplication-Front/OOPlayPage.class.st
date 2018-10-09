Class {
	#name : #OOPlayPage,
	#superclass : #OOPage,
	#instVars : [
		'themeSelectionComponent'
	],
	#category : 'OOnoz-WebApplication-Front-Pages'
}

{ #category : #accessing }
OOPlayPage >> breadcrumpLabel [
	^ 'Jouer'
]

{ #category : #hooks }
OOPlayPage >> children [
	^ Array with: self themeSelectionComponent 
]

{ #category : #accessing }
OOPlayPage >> description [
	^ 'En cours...'
]

{ #category : #accessing }
OOPlayPage >> moduleName [
	^ #list
]

{ #category : #rendering }
OOPlayPage >> renderComponentOn: html [
	html tbsContainer: [ html render: self themeSelectionComponent ]
]

{ #category : #accessing }
OOPlayPage >> themeSelectionComponent [
	^ themeSelectionComponent ifNil: [ themeSelectionComponent := OOSelectionTask page: self ]
]

{ #category : #accessing }
OOPlayPage >> themeSelectionComponent: anObject [
	themeSelectionComponent := anObject
]

{ #category : #accessing }
OOPlayPage >> title [
	^ ''
]
