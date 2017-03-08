server - resources
launchImagesServer
	self configuration inImageStaticFileServer
		ifTrue: [ (ZnServer defaultOn: self configuration staticServerPort)
				logToTranscript;
				delegate:
					(ZnStaticFileServerDelegate new
						prefixFromString: OOConfiguration resourcesURLName;
						directory: self configuration resourcesDirectory;
						yourself);
				start ]