as yet unclassified
testOrder
	self assert: ((self actualClass order: aSet) includesAll: aSet).
	self
		assert:
			((self actualClass order: aSet)
				collectWithIndex: [ :each :index | 
					each index = index
						ifTrue: [ 1 ]
						ifFalse: [ 0 ] ]) sum < aSet size