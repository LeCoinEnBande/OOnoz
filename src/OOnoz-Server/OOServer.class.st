Class {
	#name : #OOServer,
	#superclass : #Object,
	#instVars : [
		'configuration'
	],
	#classVars : [
		'UniqueInstance'
	],
	#category : 'OOnoz-Server'
}

{ #category : #accessing }
OOServer class >> current [
	^ UniqueInstance
		ifNil: [ 
			UniqueInstance := self basicNew
				initialize;
				yourself ]
]

{ #category : #'instance creation' }
OOServer class >> new [
	^ self error: 'I am a Singleton, use current to get the real server.'
]

{ #category : #accessing }
OOServer class >> reset [
	<script>
	UniqueInstance := nil
]

{ #category : #initialization }
OOServer class >> setConfigurationFromFile: aFileOrPath [
	^ self setConfigurationWith: (STON fromString: aFileOrPath asFileReference contents)
]

{ #category : #initialization }
OOServer class >> setConfigurationWith: aConfiguration [
	self current configuration: aConfiguration.
	self current launchImagesServer.
	^ self current
]

{ #category : #accessing }
OOServer >> configuration [
	^ configuration
]

{ #category : #accessing }
OOServer >> configuration: anObject [
	configuration := anObject
]

{ #category : #'server - resources' }
OOServer >> launchImagesServer [
	self configuration inImageStaticFileServer
		ifTrue: [ (ZnServer defaultOn: self configuration staticServerPort)
				logToTranscript;
				delegate:
					(ZnStaticFileServerDelegate new
						prefixFromString: OOConfiguration resourcesURLName;
						directory: self configuration resourcesDirectory;
						yourself);
				start ]
]
