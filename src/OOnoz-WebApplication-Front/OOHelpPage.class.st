Class {
	#name : #OOHelpPage,
	#superclass : #OOPage,
	#category : 'OOnoz-WebApplication-Front-Pages'
}

{ #category : #accessing }
OOHelpPage >> breadcrumpLabel [
	^ 'Aide'
]

{ #category : #accessing }
OOHelpPage >> moduleName [
	^ #help
]

{ #category : #rendering }
OOHelpPage >> renderComponentOn: html [
	html tbsContainer: [ html text: 'Soon...' ]
]

{ #category : #accessing }
OOHelpPage >> title [
	^ ''
]
