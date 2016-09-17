accessing - parameters
domainName
	"I am the domain name that should be used to point to the static files while I don't check to use a reverse proxy."

	^ self parameters at: 'domainName' ifAbsentPut: 'localhost'