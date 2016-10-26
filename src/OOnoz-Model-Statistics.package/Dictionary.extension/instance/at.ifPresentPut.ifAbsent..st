*OOnoz-Model-Statistics
at: aKey ifPresentPut: aValue ifAbsent: anErrorBlock
	self at: aKey ifPresent: [ self at: aKey put: aValue ] ifAbsent: anErrorBlock value