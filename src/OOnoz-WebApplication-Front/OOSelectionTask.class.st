Class {
	#name : #OOSelectionTask,
	#superclass : #WATask,
	#instVars : [
		'page',
		'components'
	],
	#category : 'OOnoz-WebApplication-Front-Components'
}

{ #category : #'instance creation' }
OOSelectionTask class >> page: aComponent [
	^ self new
		page: aComponent;
		yourself
]

{ #category : #accessing }
OOSelectionTask >> components [
	^ components
]

{ #category : #accessing }
OOSelectionTask >> components: anObject [
	components := anObject
]

{ #category : #running }
OOSelectionTask >> go [
	self components ifEmpty: [ self components add: (OOThemeSelectionComponent page: self page) ].
	self
		call: self components last
		onAnswer: [ :compOrInteger | 
			compOrInteger isInteger
				ifTrue: [ compOrInteger timesRepeat: [ self components removeLast ] ]
				ifFalse: [ self components add: compOrInteger ] ]
]

{ #category : #initialization }
OOSelectionTask >> initialize [
	super initialize.
	self components: LinkedList new
]

{ #category : #accessing }
OOSelectionTask >> page [
	^ page
]

{ #category : #accessing }
OOSelectionTask >> page: anObject [
	page := anObject
]
