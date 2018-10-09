"
I represent the default order of the QCM's questions.
"
Class {
	#name : #OODefaultOrder,
	#superclass : #OOAbstractOrder,
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #accessing }
OODefaultOrder class >> order: aCollection [ 
	^ aCollection sorted: [ :a :b | a index < b index ]
]
