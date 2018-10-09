dependencies
seaside3: spec
	spec
		baseline: 'Seaside3'
		with: [ spec
				loads: #('Core' 'JQuery' 'Zinc' 'Development');
				repository: 'github://SeasideSt/Seaside/repository' ]