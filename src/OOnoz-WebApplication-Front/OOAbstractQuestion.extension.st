Extension { #name : #OOAbstractQuestion }

{ #category : #'*OOnoz-WebApplication-Front' }
OOAbstractQuestion >> renderAnswersResultFrom: aComponent on: html [
	self subclassResponsibility
]

{ #category : #'*OOnoz-WebApplication-Front' }
OOAbstractQuestion >> renderAnswersSolutionFrom: aComponent on: html [
	self subclassResponsibility
]

{ #category : #'*OOnoz-WebApplication-Front' }
OOAbstractQuestion >> renderAnswersToPlayFrom: aComponent on: html [
	self subclassResponsibility
]
