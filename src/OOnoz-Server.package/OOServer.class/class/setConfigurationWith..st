initialization
setConfigurationWith: aConfiguration
	self current configuration: aConfiguration.
	self current launchImagesServer.
	^ self current