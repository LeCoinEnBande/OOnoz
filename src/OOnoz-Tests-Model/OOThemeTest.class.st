"
An OOThemeTest is a test class for testing the behavior of OOTheme
"
Class {
	#name : #OOThemeTest,
	#superclass : #OOAbstractThemeTest,
	#category : 'OOnoz-Tests-Model-Theme'
}

{ #category : #accessing }
OOThemeTest >> actualClass [
    ^ OOTheme
]

{ #category : #'tests-adding' }
OOThemeTest >> testAddSubTheme [
	| size |
	size := instance subThemes size.
	instance addSubTheme: (OOSubTheme title: 'titre du sous-theme' description: 'description du ss-theme').
	self assert: instance subThemes size equals: size + 1
]

{ #category : #'tests-adding' }
OOThemeTest >> testAddSubThemeSetThemeOfSubtheme [
	| subtheme |
	subtheme := OOSubTheme title: 'titre du sous-theme' description: 'description du ss-theme'.
	instance addSubTheme: subtheme.
	self assert: subtheme theme equals: instance
]

{ #category : #'tests-adding' }
OOThemeTest >> testRemoveSubTheme [
	| aSubTheme sizeBeforeRemoval |
	aSubTheme := OOSubTheme title: 'test' description: 'test'.
	instance addSubTheme: aSubTheme.
	sizeBeforeRemoval := instance subThemes size.
	instance removeSubTheme: aSubTheme.
	self assert: instance subThemes size equals: sizeBeforeRemoval - 1
]
