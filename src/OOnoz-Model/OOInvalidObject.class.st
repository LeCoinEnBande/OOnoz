Class {
	#name : #OOInvalidObject,
	#superclass : #OOError,
	#instVars : [
		'object',
		'reason'
	],
	#category : 'OOnoz-Model-Exceptions'
}

{ #category : #'instance creation' }
OOInvalidObject class >> modelObject: anObject [
	^ self modelObject: anObject reason: nil
]

{ #category : #'instance creation' }
OOInvalidObject class >> modelObject: anObject reason: aString [
	^ self new
		reason: aString;
		object: anObject;
		yourself
]

{ #category : #accessing }
OOInvalidObject >> object [
	^ object
]

{ #category : #accessing }
OOInvalidObject >> object: anObject [
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
OOInvalidObject >> reason [
	^ reason
]

{ #category : #accessing }
OOInvalidObject >> reason: aString [
	reason := aString
]
