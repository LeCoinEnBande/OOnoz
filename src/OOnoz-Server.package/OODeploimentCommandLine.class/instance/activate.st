activation
activate
	| contextFile |
	self flag: #todo.	"Remove the hard setup of memory DB"
	contextFile := FileLocator imageDirectory asFileReference resolve: self contextFileName.
	contextFile exists
		ifTrue: [ OOServer setConfigurationFromFile: contextFile.
			OODevHelper setupMemoryDB ]
		ifFalse: [ self error: self contextFileName , ' does not exist.' ].
	self
		startServerAdaptor;
		protectConfigByPassword;
		protectToolsByPassword;
		removeDevToolbar;
		setAsDefault