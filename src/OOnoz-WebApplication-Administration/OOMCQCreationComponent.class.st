Class {
	#name : #OOMCQCreationComponent,
	#superclass : #OOAbstractMCQEditionComponent,
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #rendering }
OOMCQCreationComponent >> breadcrumpSubLabel [
	^ #Nouveau
]

{ #category : #initialization }
OOMCQCreationComponent >> creationNewQuestionAt: i [
	| question |
	question := OOAbstractQuestion new index: i.
	self mcq addQuestion: question.
	self questionComponents add: (OOQuestionCreationComponent owner: self question: question)
]

{ #category : #initialization }
OOMCQCreationComponent >> initialize [
	super initialize.
	self mcq: OOMCQ new
]

{ #category : #accessing }
OOMCQCreationComponent >> mcq: anObject [
	super mcq: anObject.
	self questionComponents: OrderedCollection new.
	1 to: OOMCQ minimumNumberOfQuestions do: [ :i | self creationNewQuestionAt: i ].
]

{ #category : #action }
OOMCQCreationComponent >> save [
	[ self mcq validate.
	self currentUser addMCQ: self mcq.
	self mcq save.
	self currentUser save.
	self answer: true ]
		on: OOInvalidObject
		do: [ self hasBeenValidated: true ]
]

{ #category : #accessing }
OOMCQCreationComponent >> title [
	^ 'Création d''un questionnaire'
]
