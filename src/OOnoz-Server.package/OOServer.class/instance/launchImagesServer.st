server - resources
launchImagesServer
	(ZnServer defaultOn: self configuration staticServerPort)
		logToTranscript;
		delegate:
			(ZnStaticFileServerDelegate new
				prefixFromString: 'images';
				directory: self configuration resourcesDirectory;
				yourself);
		start