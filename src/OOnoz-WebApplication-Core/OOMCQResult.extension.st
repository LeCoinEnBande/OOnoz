Extension { #name : #OOMCQResult }

{ #category : #'*OOnoz-WebApplication-Core' }
OOMCQResult >> printDetailedResult [
	^ String
		streamContents: [ :s | 
			s
				<< self numberOfCorrectQuestions;
				<< ' bonne'.
			self numberOfCorrectQuestions >= 2
				ifTrue: [ s << $s ].
			s << ' réponse'.
			self numberOfCorrectQuestions >= 2
				ifTrue: [ s << $s ].
			s
				<< ' sur ';
				<< self questionResults size ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
OOMCQResult >> questionResultFor: aQuestion [
	^ self questionResults detect: [ :res | res question = aQuestion ]
]
