tests
testOrderPreserveContent
	self assert: ((self actualClass order: aSet) includesAll: aSet)