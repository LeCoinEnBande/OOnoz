as yet unclassified
current
	^ UniqueInstance
		ifNil: [ 
			UniqueInstance := self basicNew
				initialize;
				yourself ]