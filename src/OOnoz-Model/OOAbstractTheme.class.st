Class {
	#name : #OOAbstractTheme,
	#superclass : #OOObject,
	#instVars : [
		'title',
		'description',
		'mediaLink'
	],
	#category : 'OOnoz-Model-Theme'
}

{ #category : #testing }
OOAbstractTheme class >> isAbstract [
    ^ self = OOAbstractTheme
]

{ #category : #'instance-creation' }
OOAbstractTheme class >> title: aTitle description: aDescription [
	^ self new
		title: aTitle;
		description: aDescription;
		yourself
]

{ #category : #comparing }
OOAbstractTheme >> = anObject [
	^ self species = anObject species and: [ self description = anObject description and: [ self title = anObject title ] ]
]

{ #category : #testing }
OOAbstractTheme >> checkDisponibility [
	^ self subclassResponsibility 
]

{ #category : #memento }
OOAbstractTheme >> createMemento [
	^ self copy
]

{ #category : #accessing }
OOAbstractTheme >> description [
	^ description
]

{ #category : #accessing }
OOAbstractTheme >> description: anObject [
	description := anObject
]

{ #category : #testing }
OOAbstractTheme >> hasMedia [
	^ self mediaLink isNotNil
]

{ #category : #'error handing' }
OOAbstractTheme >> invalidate: aString [
	self subclassResponsibility 
]

{ #category : #accessing }
OOAbstractTheme >> mediaLink [
	^ mediaLink
]

{ #category : #accessing }
OOAbstractTheme >> mediaLink: aString [ 
	mediaLink := aString
]

{ #category : #printing }
OOAbstractTheme >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $(;
		<< self title;
		<< $)
]

{ #category : #memento }
OOAbstractTheme >> restoreFromMemento: aMemento [
	self description: aMemento description.
	self title: aMemento title.
	self mediaLink: aMemento mediaLink
]

{ #category : #accessing }
OOAbstractTheme >> title [
	^ title
]

{ #category : #accessing }
OOAbstractTheme >> title: anObject [
	title := anObject
]

{ #category : #'development support' }
OOAbstractTheme >> validate [
	self title isEmptyOrNil
		ifTrue: [ self invalidate: 'Un titre est nécessaire.' ].
	self description isEmptyOrNil
		ifTrue: [ self invalidate: 'Une description est nécessaire.' ]
]
