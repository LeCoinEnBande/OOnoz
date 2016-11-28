dependencies
ston: spec
	Metacello new
	smalltalkhubUser:  'SvenVanCaekenberghe' project: 'STON';
	version: #bleedingEdge;
	configuration: 'Ston';
	get;
	load.
	spec
		configuration: 'STON'
		with: [ spec
				version: #bleedingEdge;
            className: 'ConfigurationOfSton';
				repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/STON/main' ]