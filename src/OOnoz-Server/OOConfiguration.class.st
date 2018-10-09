Class {
	#name : #OOConfiguration,
	#superclass : #Object,
	#instVars : [
		'parameters'
	],
	#category : 'OOnoz-Server'
}

{ #category : #magicNumbers }
OOConfiguration class >> resourcesURLName [
	^ 'resources'
]

{ #category : #STON }
OOConfiguration class >> stonName [
	^ #Configuration
]

{ #category : #'accessing - parameters' }
OOConfiguration >> domainName [
	"I am the domain name that should be used to point to the static files while I don't check to use a reverse proxy."

	^ self parameters at: 'domainName' ifAbsentPut: 'localhost'
]

{ #category : #accessing }
OOConfiguration >> domainName: aString [
	self parameters at: 'domainName' put: aString
]

{ #category : #'accessing - parameters' }
OOConfiguration >> email [
	"I am the email that should be use to send the mails of the application."

	^ self parameters at: 'email' ifAbsentPut: 'oonoz.company@gmail.com'
]

{ #category : #accessing }
OOConfiguration >> email: aString [
	self parameters at: 'email' put: aString
]

{ #category : #'accessing - parameters' }
OOConfiguration >> emailPass [
	"I am the password of the email that should be use to send the mails of the application."

	^ self parameters at: 'emailPass' ifAbsentPut: 'OOnozProject'
]

{ #category : #accessing }
OOConfiguration >> emailPass: aString [
	self parameters at: 'emailPass' put: aString
]

{ #category : #'accessing - parameters' }
OOConfiguration >> emailPort [
	"I am the email port that should be use to send the mails of the application."

	^ self parameters at: 'emailPort' ifAbsentPut: 465
]

{ #category : #accessing }
OOConfiguration >> emailPort: aNumber [
	self parameters at: 'emailPort' put: aNumber
]

{ #category : #'accessing - parameters' }
OOConfiguration >> emailServer [
	"I am the email server that should be use to send the mails of the application."

	^ self parameters at: 'emailServer' ifAbsentPut: 'smtp.gmail.com'
]

{ #category : #accessing }
OOConfiguration >> emailServer: aString [
	self parameters at: 'emailServer' put: aString
]

{ #category : #'accessing - parameters' }
OOConfiguration >> inImageStaticFileServer [
	^ self parameters at: 'inImageStaticFileServer' ifAbsentPut: true
]

{ #category : #accessing }
OOConfiguration >> inImageStaticFileServer: aBoolean [
	self parameters at: 'inImageStaticFileServer' put: aBoolean
]

{ #category : #initialization }
OOConfiguration >> initialize [
	super initialize.
	self parameters: Dictionary new
]

{ #category : #accessing }
OOConfiguration >> parameters [
	^ parameters
]

{ #category : #accessing }
OOConfiguration >> parameters: anObject [
	parameters := anObject
]

{ #category : #'accessing - parameters' }
OOConfiguration >> port [
	"I am the port of the server of which the application should be deployed."

	^ self parameters at: 'port' ifAbsentPut: 8080
]

{ #category : #accessing }
OOConfiguration >> port: anInteger [
	self parameters at: 'port' put: anInteger
]

{ #category : #conveniance }
OOConfiguration >> resourcesDirectory [
	^ self resourcesDirectoryPath asFileReference
]

{ #category : #'accessing - parameters' }
OOConfiguration >> resourcesDirectoryPath [
	"I am a string representing the path of the directory where the static resources of the application should be store. The path should be relative to the directory."

	^ self parameters at: 'resourcesDirectoryPath' ifAbsentPut: '../../GitRepositories/OOnoz/resources'
]

{ #category : #accessing }
OOConfiguration >> resourcesDirectoryPath: aPathString [
	^ self parameters at: 'resourcesDirectoryPath' put: aPathString
]

{ #category : #conveniance }
OOConfiguration >> resourcesURL [
	^ String
		streamContents: [ :stream | 
			stream
				<< '//';
				<< self domainName;
				<< $:;
				<< self staticServerPort;
				<< $/;
				<< self class resourcesURLName ]
]

{ #category : #'accessing - parameters' }
OOConfiguration >> staticServerPort [
	"I am the port of the static file server."

	^ self parameters at: 'staticServerPort' ifAbsentPut: 1701
]

{ #category : #accessing }
OOConfiguration >> staticServerPort: anInteger [
	self parameters at: 'staticServerPort' put: anInteger
]
