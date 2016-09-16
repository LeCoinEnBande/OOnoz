accessing
current
	^ UniqueInstance
		ifNil: [ 
			UniqueInstance := self basicNew
				initialize;
				yourself ]