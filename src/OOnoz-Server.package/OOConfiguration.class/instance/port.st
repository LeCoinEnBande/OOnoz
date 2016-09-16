accessing - parameters
port
	"I am the port of the server of which the application should be deployed."

	^ self parameters at: 'port' ifAbsentPut: 8080