"
I am a simple abstraction layer to add some conveniance methods.
"
Class {
	#name : #OOObject,
	#superclass : #Object,
	#category : 'OOnoz-Model-Core'
}

{ #category : #'error handling' }
OOObject >> error: aString [
	"Throw a generic Error exception."

	^ OOError signal: aString
]

{ #category : #testing }
OOObject >> isUser [
	^ false
]

{ #category : #printing }
OOObject >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $[;
		<< self hash;
		<< $]
]
