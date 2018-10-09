"
An OOAbstractOrderTest is a test class for testing the behavior of OOAbstractOrder
"
Class {
	#name : #OOAbstractOrderTest,
	#superclass : #TestCase,
	#instVars : [
		'aSet'
	],
	#category : 'OOnoz-Tests-Model'
}

{ #category : #testing }
OOAbstractOrderTest class >> isAbstract [
	^ self = OOAbstractOrderTest 
]

{ #category : #helpers }
OOAbstractOrderTest >> aTestingSet [
	^ (1 to: 200)
		collect: [ :int | 
			| mock |
			mock := Mock new.
			mock stub index willReturn: int.
			mock ]
		as: Set
]

{ #category : #accessing }
OOAbstractOrderTest >> actualClass [
	^ self subclassResponsibility 
]

{ #category : #running }
OOAbstractOrderTest >> setUp [
	aSet := self aTestingSet
]

{ #category : #tests }
OOAbstractOrderTest >> testOrder [
	self subclassResponsibility 
]

{ #category : #tests }
OOAbstractOrderTest >> testOrderPreserveContent [
	self assert: ((self actualClass order: aSet) includesAll: aSet)
]
