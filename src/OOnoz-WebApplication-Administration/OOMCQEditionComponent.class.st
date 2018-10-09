Class {
	#name : #OOMCQEditionComponent,
	#superclass : #OOAbstractMCQEditionComponent,
	#instVars : [
		'memento'
	],
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #'instance creation' }
OOMCQEditionComponent class >> mcq: aMCQ [
	^ self new
	 	mcq: aMCQ; 
		yourself
]

{ #category : #rendering }
OOMCQEditionComponent >> breadcrumpSubLabel [
	^ #Éditer
]

{ #category : #hook }
OOMCQEditionComponent >> cancel [
	self mcq restoreFromMemento: self memento.
	self questionComponents do: #reset.
	super cancel
]

{ #category : #accessing }
OOMCQEditionComponent >> mcq: anObject [
	super mcq: anObject.
	self memento: mcq createMemento.
	self
		questionComponents:
			((mcq questions collect: [ :q | OOQuestionEditionComponent owner: self question: q ])
				asArray sort: [ :q1 :q2 | q1 question index < q2 question index ])
]

{ #category : #accessing }
OOMCQEditionComponent >> memento [
	^ memento
]

{ #category : #accessing }
OOMCQEditionComponent >> memento: anObject [
	memento := anObject
]

{ #category : #action }
OOMCQEditionComponent >> save [
	[ self mcq validate.
	self mcq save.
	self answer: true ]
		on: OOInvalidObject
		do: [ self hasBeenValidated: true ]
]

{ #category : #accessing }
OOMCQEditionComponent >> title [
	^ 'Édition d''un questionnaire'
]
