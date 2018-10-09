Class {
	#name : #OOTheme,
	#superclass : #OOAbstractTheme,
	#instVars : [
		'subThemes'
	],
	#category : 'OOnoz-Model-Theme'
}

{ #category : #voyage }
OOTheme class >> isVoyageRoot [
	^ true
]

{ #category : #adding }
OOTheme >> addSubTheme: aSubTheme [
	aSubTheme theme: self.
	self subThemes add: aSubTheme.
]

{ #category : #testing }
OOTheme >> checkDisponibility [
	(self class selectOne: [ :them | them title = self title ]) isNotNil
		ifTrue: [ (OOUnavailableTheme modelObject: self reason: 'Il existe déjà un thème de ce nom.')
				signal ]
]

{ #category : #initialization }
OOTheme >> initialize [
	super initialize.
	self subThemes: OrderedCollection new
]

{ #category : #'error handing' }
OOTheme >> invalidate: aString [
	(OOInvalidTheme modelObject: self reason: aString) signal
]

{ #category : #copying }
OOTheme >> postCopy [
	self subThemes: (self subThemes collect: #copy)
]

{ #category : #adding }
OOTheme >> removeSubTheme: aSubTheme [
	self subThemes remove: aSubTheme ifAbsent: [  ]
]

{ #category : #memento }
OOTheme >> restoreFromMemento: aMemento [
	super restoreFromMemento: aMemento.
	self subThemes: OrderedCollection new.
	aMemento subThemes do: [ :s | self addSubTheme: s ]
]

{ #category : #accessing }
OOTheme >> subThemes [
	^ subThemes
]

{ #category : #accessing }
OOTheme >> subThemes: anObject [
	subThemes := anObject
]

{ #category : #'development support' }
OOTheme >> validate [
	super validate
]

{ #category : #'development support' }
OOTheme >> validateTheme [
	self validateTheme.
	self subThemes do: #validate
]
