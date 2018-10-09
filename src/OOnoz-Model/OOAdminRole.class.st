Class {
	#name : #OOAdminRole,
	#superclass : #OOAbstractRole,
	#category : 'OOnoz-Model-Core'
}

{ #category : #testing }
OOAdminRole class >> isAdmin [
	^ true
]

{ #category : #accessing }
OOAdminRole class >> mongoDescription [
	^ #admin
]
