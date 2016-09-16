accessing - parameters
staticServerPort
	"I am the port of the static file server."

	^ self parameters at: 'staticServerPort' ifAbsentPut: 1701