rendering
defineScrollCallbackOn: aDiv
	^ aDiv
		storeCallback:
			(WAValueCallback
				on: [ :intervalRequest | 
					self requestContext
						respond: [ :response | 
							| interval |
							interval := intervalRequest substrings: ':'.
							self
								printHtmlForElementsFrom: interval first asNumber
								to: interval last asNumber
								context: aDiv canvas context
								on:
									(response
										doNotCache;
										contentType: WAMimeType textHtml;
										stream) ] ])