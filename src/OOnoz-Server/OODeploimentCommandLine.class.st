Class {
	#name : #OODeploimentCommandLine,
	#superclass : #CommandLineHandler,
	#category : 'OOnoz-Server'
}

{ #category : #accessing }
OODeploimentCommandLine class >> commandName [
	^ #deploy
]

{ #category : #accessing }
OODeploimentCommandLine class >> defaultConfigurationFileName [
	^ 'configurationServer.ston'
]

{ #category : #accessing }
OODeploimentCommandLine class >> description [
	^ 'I launche a server of OOnoz.'
]

{ #category : #activation }
OODeploimentCommandLine >> activate [
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
		setAsDefault.
	Smalltalk snapshot: true andQuit: true
]

{ #category : #accessing }
OODeploimentCommandLine >> contextFileName [
	^ self optionAt: 'context' ifAbsent: [ self class defaultConfigurationFileName ]
]

{ #category : #activation }
OODeploimentCommandLine >> protectConfigByPassword [
	| application |
	application := WAAdmin defaultDispatcher handlerAt: 'config'.
	application configuration addParent: WAAuthConfiguration instance.
	application
		preferenceAt: #login put: 'admin';
		preferenceAt: #passwordHash put: (GRPlatform current secureHashFor: 'seasideiscool').
	application addFilter: WAAuthenticationFilter new
]

{ #category : #activation }
OODeploimentCommandLine >> protectToolsByPassword [
	| application |
	application := WAAdmin defaultDispatcher handlerAt: 'tools/'.
	application configuration addParent: WAAuthConfiguration instance.
	application
		preferenceAt: #login put: 'admin';
		preferenceAt: #passwordHash put: (GRPlatform current secureHashFor: 'seasideiscool').
	application addFilter: WAAuthenticationFilter new
]

{ #category : #removing }
OODeploimentCommandLine >> removeDevToolbar [
	WAAdmin disableDevelopmentTools.
	"What is following is a hack because of a seaside bug."
	#(#OOBackRoot #OOFrontRoot #OORequestHandler)
		do: [ :e | 
			[ e asClass initialize ]
				on: NotFound
				do: [  ] ]
]

{ #category : #activation }
OODeploimentCommandLine >> setAsDefault [
	WAAdmin defaultDispatcher defaultName: 'OOnoz'
]

{ #category : #activation }
OODeploimentCommandLine >> startServerAdaptor [
	ZnZincServerAdaptor startOn: OOServer current configuration port
]
