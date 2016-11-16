handling
handleFiltered: aRequestContext
	aRequestContext
		respond: [ :response | 
			response
				contentType: WAMimeType textPlain;
				nextPutAll: (self tryToActivateUserFrom: aRequestContext) ]