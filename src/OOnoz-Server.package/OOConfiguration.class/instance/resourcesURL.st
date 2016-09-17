conveniance
resourcesURL
	^ String
		streamContents: [ :stream | 
			stream
				<< 'http://';
				<< self domainName;
				<< $:;
				<< self staticServerPort;
				<< $/;
				<< self class resourcesURLName ]