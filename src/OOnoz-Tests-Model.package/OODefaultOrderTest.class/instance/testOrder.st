tests
testOrder
	self assert: ((self actualClass order: aSet) includesAll: aSet).
	(self actualClass order: aSet) doWithIndex: [ :each :index | self assert: each index equals: index ]