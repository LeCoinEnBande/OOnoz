dependencies
voyage: spec
	"Persistance manager"

	spec
		baseline: 'Voyage'
		with: [ spec
				repository: 'github://pharo-nosql/voyage:master/mc';
				loads: #('mongo' 'memory') ]