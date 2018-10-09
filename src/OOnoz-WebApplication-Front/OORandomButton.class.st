Class {
	#name : #OORandomButton,
	#superclass : #OOComponent,
	#instVars : [
		'scope',
		'page'
	],
	#category : 'OOnoz-WebApplication-Front-Components'
}

{ #category : #'instance creation' }
OORandomButton class >> scope: aCollection page: aPage [
	^ self new
		scope: aCollection;
		page: aPage;
		yourself
]

{ #category : #accessing }
OORandomButton >> description [
	^ 'En selectionnant cette carte vous allez tomber sur un questionnaire aléatoire. Ce questionnaire dépendra de ce la selection de thème/sous thème que vous avez effectué.'
]

{ #category : #accessing }
OORandomButton >> page [
	^ page
]

{ #category : #accessing }
OORandomButton >> page: anObject [
	page := anObject
]

{ #category : #rendering }
OORandomButton >> renderContentOn: html [
	html tbsAnchor
		callback: [ self page call: (OOPlayComponent mcq: self scope atRandom) ];
		bePrimary;
		class: '';
		with: [ html span class: 'fa fa-random'.
			html text: ' QCM Aléatoire' ]
]

{ #category : #accessing }
OORandomButton >> scope [
	^ scope
]

{ #category : #accessing }
OORandomButton >> scope: anObject [
	scope := anObject
]

{ #category : #'as yet unclassified' }
OORandomButton >> themeMediaUrl [
	^ self configuration resourcesURL , '/images/random.png'
]

{ #category : #accessing }
OORandomButton >> title [
	^ 'Questionnaire aléatoire'
]
