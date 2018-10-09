"
I represent the random order of the QCM's questions.
"
Class {
	#name : #OORandomOrder,
	#superclass : #OOAbstractOrder,
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #accessing }
OORandomOrder class >> order: aCollection [ 
	^ aCollection asArray shuffle
]
