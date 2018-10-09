Class {
	#name : #OOProfilePage,
	#superclass : #OOPage,
	#instVars : [
		'profilComponent'
	],
	#category : 'OOnoz-WebApplication-Core'
}

{ #category : #accessing }
OOProfilePage >> breadcrumpLabel [
	^ #Profil
]

{ #category : #initialization }
OOProfilePage >> initialize [
	super initialize.
	self profilComponent: OOProfileComponent new
]

{ #category : #accessing }
OOProfilePage >> moduleName [
	^ #profile
]

{ #category : #accessing }
OOProfilePage >> profilComponent [
	^ profilComponent
]

{ #category : #accessing }
OOProfilePage >> profilComponent: anObject [
	profilComponent := anObject
]

{ #category : #rendering }
OOProfilePage >> renderComponentOn: html [
	html render: self profilComponent
]

{ #category : #accessing }
OOProfilePage >> title [
	^ ''
]
