Class {
	#name : #OOSubThemeTest,
	#superclass : #OOAbstractThemeTest,
	#category : 'OOnoz-Tests-Model-Theme'
}

{ #category : #accessing }
OOSubThemeTest >> actualClass [
    ^ OOSubTheme
]

{ #category : #'instance creation' }
OOSubThemeTest >> newInstance [
	^ super newInstance
		theme: OOThemeTest new newInstance;
		yourself
]
