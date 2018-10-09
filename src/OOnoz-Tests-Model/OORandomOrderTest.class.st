"
An OORandomOrderTest is a test class for testing the behavior of OORandomOrder
"
Class {
	#name : #OORandomOrderTest,
	#superclass : #OOAbstractOrderTest,
	#category : 'OOnoz-Tests-Model'
}

{ #category : #accessing }
OORandomOrderTest >> actualClass [
	^ OORandomOrder 
]

{ #category : #'as yet unclassified' }
OORandomOrderTest >> testOrder [
	self assert: ((self actualClass order: aSet) includesAll: aSet).
	self
		assert:
			((self actualClass order: aSet)
				collectWithIndex: [ :each :index | 
					each index = index
						ifTrue: [ 1 ]
						ifFalse: [ 0 ] ]) sum < aSet size
]
