Class {
	#name : #OOThemeComponent,
	#superclass : #OOComponent,
	#instVars : [
		'model',
		'subThemes'
	],
	#category : 'OOnoz-WebApplication-Administration-Components'
}

{ #category : #accessing }
OOThemeComponent >> model [
	^ model
]

{ #category : #accessing }
OOThemeComponent >> model: anObject [
	model := anObject
]

{ #category : #accessing }
OOThemeComponent >> subThemes [
	^ subThemes
]

{ #category : #accessing }
OOThemeComponent >> subThemes: anObject [
	subThemes := anObject
]
