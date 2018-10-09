Class {
	#name : #OOQuestionEditionComponent,
	#superclass : #OOAbstractQuestionEditionComponent,
	#instVars : [
		'memento'
	],
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #accessing }
OOQuestionEditionComponent >> memento [
	^ memento
]

{ #category : #accessing }
OOQuestionEditionComponent >> memento: anObject [
	memento := anObject
]

{ #category : #accessing }
OOQuestionEditionComponent >> question: anObject [
	question := anObject.
	self memento: question createMemento
]

{ #category : #accessing }
OOQuestionEditionComponent >> reset [
	self question restoreFromMemento: self memento
]
