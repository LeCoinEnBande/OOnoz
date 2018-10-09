Class {
	#name : #OOAbstractGiftStrategy,
	#superclass : #OOObject,
	#instVars : [
		'gift'
	],
	#category : 'OOnoz-Model-MCQ'
}

{ #category : #'instance creation' }
OOAbstractGiftStrategy class >> gift: aGift [
	^ self new
		gift: aGift;
		yourself
]

{ #category : #accessing }
OOAbstractGiftStrategy >> gift [
	^ gift
]

{ #category : #accessing }
OOAbstractGiftStrategy >> gift: aGift [ 
	gift := aGift
]
