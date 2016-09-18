initialization
instanceOf: aComponentClass
	^ self componentsInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ]