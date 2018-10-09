Class {
	#name : #OOSession,
	#superclass : #WASession,
	#instVars : [
		'rootComponent',
		'user'
	],
	#category : 'OOnoz-WebApplication-Core'
}

{ #category : #initialization }
OOSession >> initialize [
	super initialize.
	self resetUser
]

{ #category : #testing }
OOSession >> isLogged [
	^ self user isLogged
]

{ #category : #initialization }
OOSession >> resetUser [
	self user: OONilUser new
]

{ #category : #accessing }
OOSession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
OOSession >> rootComponent: anObject [
	rootComponent := anObject
]

{ #category : #accessing }
OOSession >> user [
	^ user
]

{ #category : #accessing }
OOSession >> user: anObject [
	user := anObject
]
