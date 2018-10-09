Class {
	#name : #OOPlayerRole,
	#superclass : #OOAbstractRole,
	#category : 'OOnoz-Model-Core'
}

{ #category : #testing }
OOPlayerRole class >> logToAdminApplication [
	^ false
]

{ #category : #accessing }
OOPlayerRole class >> mongoDescription [
	^ #player
]
