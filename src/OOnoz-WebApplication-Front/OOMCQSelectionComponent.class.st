Class {
	#name : #OOMCQSelectionComponent,
	#superclass : #OOAbstractSelectionComponent,
	#instVars : [
		'subtheme',
		'mcqFilter'
	],
	#category : 'OOnoz-WebApplication-Front-Components'
}

{ #category : #'instance creation' }
OOMCQSelectionComponent class >> subtheme: aSubTheme page: aComponent [
	^ self new
		subtheme: aSubTheme;
		page: aComponent;
		yourself
]

{ #category : #'as yet unclassified' }
OOMCQSelectionComponent >> entityName [
	^ 'questionnaire'
]

{ #category : #initialization }
OOMCQSelectionComponent >> initialize [
	super initialize.
	self
		mcqFilter:
			((OOMCQFilter refreshScript: [ :html | 'location.reload()' js ])
				shouldDisplayState: false;
				yourself)
]

{ #category : #'as yet unclassified' }
OOMCQSelectionComponent >> inputEntities [
	^ self mcqFilter filter: (OOAbstractMCQ selectMany: [ :m | m subThemes includes: self subtheme ]) asArray
]

{ #category : #accessing }
OOMCQSelectionComponent >> mcqFilter [
	^ mcqFilter
]

{ #category : #accessing }
OOMCQSelectionComponent >> mcqFilter: anObject [
	mcqFilter := anObject
]

{ #category : #'as yet unclassified' }
OOMCQSelectionComponent >> randomScope [
	^ self mcqFilter filter: (OOAbstractMCQ allActivesFromSubTheme: self subtheme playableBy: self currentUser)
]

{ #category : #rendering }
OOMCQSelectionComponent >> renderOptionsHookOn: html [
	html render: self mcqFilter.
	html document
		addLoadScript:
			'$(".checkbox").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)});$(".material-switch").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)})'
				js
]

{ #category : #enumerating }
OOMCQSelectionComponent >> select: aMCQ [
	self page call: (OOPlayComponent mcq: aMCQ)
]

{ #category : #'as yet unclassified' }
OOMCQSelectionComponent >> stepNumber [
	^ 3
]

{ #category : #accessing }
OOMCQSelectionComponent >> subtheme [
	^ subtheme
]

{ #category : #accessing }
OOMCQSelectionComponent >> subtheme: anObject [
	subtheme := anObject
]
