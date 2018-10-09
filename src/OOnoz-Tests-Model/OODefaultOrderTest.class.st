"
An OODefaultOrderTest is a test class for testing the behavior of OODefaultOrder
"
Class {
	#name : #OODefaultOrderTest,
	#superclass : #OOAbstractOrderTest,
	#category : 'OOnoz-Tests-Model'
}

{ #category : #accessing }
OODefaultOrderTest >> actualClass [
	^ OODefaultOrder
]

{ #category : #tests }
OODefaultOrderTest >> testOrder [
	self assert: ((self actualClass order: aSet) includesAll: aSet).
	(self actualClass order: aSet) doWithIndex: [ :each :index | self assert: each index equals: index ]
]
