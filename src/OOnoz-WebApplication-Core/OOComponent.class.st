Class {
	#name : #OOComponent,
	#superclass : #WAComponent,
	#category : 'OOnoz-WebApplication-Core'
}

{ #category : #asserting }
OOComponent class >> shouldShowJumbotron [
	^ false
]

{ #category : #conveniance }
OOComponent >> configuration [
	^ self server configuration
]

{ #category : #conveniance }
OOComponent >> currentUser [
	^ self session user
]

{ #category : #conveniance }
OOComponent >> displayDefaultScreen [
	self rootComponent displayDefaultScreen
]

{ #category : #conveniance }
OOComponent >> emailUtils [
	^ OOEmailUtil
]

{ #category : #conveniance }
OOComponent >> isLogged [
	^ self session isLogged
]

{ #category : #conveniance }
OOComponent >> logUser: aUser [ 
	self session user: aUser
]

{ #category : #conveniance }
OOComponent >> logout [
	self session resetUser.
	self rootComponent initScreens
]

{ #category : #printing }
OOComponent >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $[;
		<< self hash;
		<< $]
]

{ #category : #conveniance }
OOComponent >> resourcesURL [
	^ self configuration resourcesURL
]

{ #category : #conveniance }
OOComponent >> rootComponent [
	^ self session rootComponent
]

{ #category : #conveniance }
OOComponent >> rootDialogId [
	^ #'root-dialog'
]

{ #category : #conveniance }
OOComponent >> server [
	^ OOServer current 
]
