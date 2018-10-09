Class {
	#name : #OOUnavailableObject,
	#superclass : #OOError,
	#instVars : [
		'object',
		'reason'
	],
	#category : 'OOnoz-Model-Exceptions'
}

{ #category : #'instance creation' }
OOUnavailableObject class >> modelObject: anObject [
	^ self modelObject: anObject reason: nil
]

{ #category : #'instance creation' }
OOUnavailableObject class >> modelObject: anObject reason: aString [
	^ self new
		reason: aString;
		object: anObject;
		yourself
]

{ #category : #accessing }
OOUnavailableObject >> object [
	^ object
]

{ #category : #accessing }
OOUnavailableObject >> object: anObject [
	object := anObject.
	self
		messageText:
			(String
				streamContents: [ :s | 
					s
						<< self object asString;
						<< ' is invalid.'.
					self reason ifNotNil: [ :r | s << r ] ])
]

{ #category : #accessing }
OOUnavailableObject >> reason [
	^ reason
]

{ #category : #accessing }
OOUnavailableObject >> reason: aString [
	reason := aString
]
