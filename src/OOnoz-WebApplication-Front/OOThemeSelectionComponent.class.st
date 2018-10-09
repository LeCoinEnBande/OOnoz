Class {
	#name : #OOThemeSelectionComponent,
	#superclass : #OOAbstractSelectionComponent,
	#category : 'OOnoz-WebApplication-Front-Components'
}

{ #category : #'as yet unclassified' }
OOThemeSelectionComponent >> entityName [
	^ 'thème'
]

{ #category : #'as yet unclassified' }
OOThemeSelectionComponent >> inputEntities [
	^ OOTheme selectAll asOrderedCollection 
]

{ #category : #'as yet unclassified' }
OOThemeSelectionComponent >> randomScope [
	^ OOAbstractMCQ allActivesPlayableBy: self currentUser
]

{ #category : #enumerating }
OOThemeSelectionComponent >> select: aTheme [
	self answer: (OOSubThemeSelectionComponent theme: aTheme page: self page)
]

{ #category : #'as yet unclassified' }
OOThemeSelectionComponent >> stepNumber [
	^ 1
]
