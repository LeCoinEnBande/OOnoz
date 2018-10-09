Class {
	#name : #OOAbstractGift,
	#superclass : #OOObject,
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #testing }
OOAbstractGift class >> isAbstract [
	^ self = OOAbstractGift
]

{ #category : #comparing }
OOAbstractGift >> = anObject [
	^ self species = anObject species and: [ self description = anObject description ]
]

{ #category : #accessing }
OOAbstractGift >> description [
	^ ''
]

{ #category : #testing }
OOAbstractGift >> hasGift [
	^ false
]
