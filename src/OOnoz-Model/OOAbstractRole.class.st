Class {
	#name : #OOAbstractRole,
	#superclass : #Object,
	#category : 'OOnoz-Model-Core'
}

{ #category : #accessing }
OOAbstractRole class >> isAdmin [
	^ false
]

{ #category : #accessing }
OOAbstractRole class >> mongoDescription [ 
	^ self subclassResponsibility 
]

{ #category : #accessing }
OOAbstractRole class >> roleFrom: aString [
	^ self allSubclasses detect: [ :class | class mongoDescription = aString ]
]
