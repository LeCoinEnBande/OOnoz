Class {
	#name : #OOSubTheme,
	#superclass : #OOAbstractTheme,
	#instVars : [
		'theme'
	],
	#category : 'OOnoz-Model-Theme'
}

{ #category : #testing }
OOSubTheme >> checkDisponibility [
	(self theme isNil or: [ self theme class selectOne: [ :them | (them subThemes collect: #title) includes: self title ] ]) isNotNil
		ifTrue: [ (OOUnavailableSubTheme modelObject: self reason: 'Ce thème posséde déjà un sous thème de ce nom.') signal ]
]

{ #category : #'error handing' }
OOSubTheme >> invalidate: aString [
	(OOInvalidSubTheme modelObject: self reason: aString) signal
]

{ #category : #memento }
OOSubTheme >> restoreFromMemento: aMemento [
	super restoreFromMemento: aMemento.
	self theme: aMemento theme.
	(self theme subThemes includes: self)
		ifFalse: [ self theme addSubTheme: self ]
]

{ #category : #accessing }
OOSubTheme >> theme [
	^ theme
]

{ #category : #accessing }
OOSubTheme >> theme: anTheme [
	theme ifNotNil: [ :t | t removeSubTheme: self ].
	theme := anTheme
]

{ #category : #'development support' }
OOSubTheme >> validate [
	super validate.
	self theme ifNil: [ self invalidate: 'Un sous thème devrabit avoir un thème.' ]
]
