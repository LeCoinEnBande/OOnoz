Class {
	#name : #OOAbstractThemeTest,
	#superclass : #TestCase,
	#instVars : [
		'instance'
	],
	#category : 'OOnoz-Tests-Model-Theme'
}

{ #category : #testing }
OOAbstractThemeTest class >> isAbstract [
    ^ self = OOAbstractThemeTest
]

{ #category : #accessing }
OOAbstractThemeTest >> actualClass [
    ^ self subclassResponsibility
]

{ #category : #'instance creation' }
OOAbstractThemeTest >> newInstance [
	^ self actualClass title: 'title' description: 'description'
]

{ #category : #running }
OOAbstractThemeTest >> setUp [
	instance := self newInstance
]

{ #category : #tests }
OOAbstractThemeTest >> testCheckDisponibility [
	[ (OOTheme stub selectOne: Any) willReturn: self newInstance.
	self should: [ instance checkDisponibility ] raise: OOUnavailableObject ]
		ensure: [ OOTheme recoverFromGHMutation ]
]

{ #category : #tests }
OOAbstractThemeTest >> testCreateMemento [
	| copy |
	copy := instance createMemento.
	self assert: copy equals: instance.
	self deny: copy == instance.
	instance title: 'Other'.
	self deny: copy = instance
]

{ #category : #tests }
OOAbstractThemeTest >> testHasMedia [
	instance mediaLink: nil.
	self deny: instance hasMedia.
	instance mediaLink: 'anURL'.
	self assert: instance hasMedia
]

{ #category : #tests }
OOAbstractThemeTest >> testInitialize [
	self assert: instance title isNotNil.
	self assert: instance description isNotNil
]

{ #category : #tests }
OOAbstractThemeTest >> testInvalidate [
	self should: [ instance invalidate: 'aMessage' ] raise: OOError
]

{ #category : #tests }
OOAbstractThemeTest >> testRestoreFromMemento [
	| copy |
	copy := instance createMemento.
	instance title: 'mon super titre'.
	self deny: copy = instance.
	instance restoreFromMemento: copy.
	self assert: copy equals: instance
]
