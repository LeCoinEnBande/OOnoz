initialization
setConfigurationFromFile: aFileOrPath
	^ self setConfigurationWith: (STON fromString: aFileOrPath asFileReference contents)