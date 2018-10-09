Class {
	#name : #OOFrontRoot,
	#superclass : #OOAbstractRoot,
	#category : 'OOnoz-WebApplication-Front-Core'
}

{ #category : #initialization }
OOFrontRoot class >> initialize [
	<oonozApplication>
	| app |
	app := WAAdmin register: self asApplicationAt: 'OOnoz'.
	app preferenceAt: #sessionClass put: OOSession.
	app configuration at: #maximumAbsoluteAge put: 0.
	app configuration at: #maximumRelativeAge put: self sessionDuration
]

{ #category : #components }
OOFrontRoot >> defaultHeader [
	^ OOFrontHeader new
]

{ #category : #initialization }
OOFrontRoot >> displayDefaultScreen [
	self setInstanceOf: OOWelcomePage
]
