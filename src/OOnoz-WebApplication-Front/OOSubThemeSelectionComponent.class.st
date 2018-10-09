Class {
	#name : #OOSubThemeSelectionComponent,
	#superclass : #OOAbstractSelectionComponent,
	#instVars : [
		'theme'
	],
	#category : 'OOnoz-WebApplication-Front-Components'
}

{ #category : #'instance creation' }
OOSubThemeSelectionComponent class >> theme: aTheme page: aComponent [
	^ self new
		theme: aTheme;
		page: aComponent;
		yourself
]

{ #category : #'as yet unclassified' }
OOSubThemeSelectionComponent >> entityName [
	^ 'sous-thème'
]

{ #category : #'as yet unclassified' }
OOSubThemeSelectionComponent >> inputEntities [
	^ self theme subThemes
]

{ #category : #'as yet unclassified' }
OOSubThemeSelectionComponent >> randomScope [
	| u |
	u := self currentUser.
	^ OOAbstractMCQ allActivesFromTheme: self theme playableBy: self currentUser
]

{ #category : #enumerating }
OOSubThemeSelectionComponent >> select: aSubTheme [
	self answer: (OOMCQSelectionComponent subtheme: aSubTheme page: self page)
]

{ #category : #'as yet unclassified' }
OOSubThemeSelectionComponent >> stepNumber [
	^ 2
]

{ #category : #accessing }
OOSubThemeSelectionComponent >> theme [
	^ theme
]

{ #category : #accessing }
OOSubThemeSelectionComponent >> theme: anObject [
	theme := anObject
]
