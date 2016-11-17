accessing
contextFileName
	^ self optionAt: 'context' ifAbsent: [ self class defaultConfigurationFileName ]