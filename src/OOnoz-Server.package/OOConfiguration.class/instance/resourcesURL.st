conveniance
resourcesURL
	^ String
		streamContents: [ :stream | 
			stream
				<< '//';
				<< self domainName;
				<< $:;
				<< self staticServerPort;
				<< $/;
				<< self class resourcesURLName ]