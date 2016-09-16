server - resources
launchImagesServer
	self flag: #todo. "Do not hardcode images + use a better name as resources."
	(ZnServer defaultOn: self configuration staticServerPort)
		logToTranscript;
		delegate:
			(ZnStaticFileServerDelegate new
				prefixFromString: 'images';
				directory: self configuration resourcesDirectory;
				yourself);
		start