Extension { #name : #OOQuestionResult }

{ #category : #'*OOnoz-WebApplication-Core' }
OOQuestionResult >> printResult [
	^ String streamContents: [ :s | self printResultOn: s ]
]
