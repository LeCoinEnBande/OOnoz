Class {
	#name : #OOMCQRate,
	#superclass : #OOObject,
	#instVars : [
		'mcq',
		'user',
		'rate'
	],
	#category : 'OOnoz-Model-Statistics-Core'
}

{ #category : #testing }
OOMCQRate class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
OOMCQRate class >> mcq: aMCQ user: aUser [
	^ self new
		mcq: aMCQ;
		user: aUser;
		yourself
]

{ #category : #'instance creation' }
OOMCQRate class >> rate: aNumber [
	^ self new
		rate: aNumber;
		yourself
]

{ #category : #accessing }
OOMCQRate class >> rateObjectOf: aUser for: aMcq [
	^ (OOMCQRate selectOne: [ :r | r mcq = aMcq and: [ r user = aUser ] ]) ifNil: [ OOMCQRate mcq: aMcq user: aUser ]
]

{ #category : #accessing }
OOMCQRate class >> rateOf: aMCQ [
	^ ((self selectMany: [ :r | r isRated and: [ r mcq = aMCQ ] ])
		collect: #rate) ifEmpty: [ 0 ] ifNotEmpty: #average
]

{ #category : #comparing }
OOMCQRate >> = anObject [
	^ super = anObject
		or: [ self species = anObject species
				and: [ self mcq = anObject mcq and: [ self user = anObject user and: [ self rate = anObject rate ] ] ] ]
]

{ #category : #initialization }
OOMCQRate >> initialize [
	super initialize.
	self rate: 0
]

{ #category : #testing }
OOMCQRate >> isRated [
	^ self rate isNotNil
]

{ #category : #accessing }
OOMCQRate >> mcq [
	^ mcq
]

{ #category : #accessing }
OOMCQRate >> mcq: anObject [
	mcq := anObject
]

{ #category : #accessing }
OOMCQRate >> rate [
	^ rate
]

{ #category : #accessing }
OOMCQRate >> rate: anObject [
	rate := anObject
]

{ #category : #accessing }
OOMCQRate >> user [
	^ user
]

{ #category : #accessing }
OOMCQRate >> user: anObject [
	user := anObject
]
