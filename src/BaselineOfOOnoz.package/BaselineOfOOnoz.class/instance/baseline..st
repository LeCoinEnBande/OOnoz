baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ self
				seaside3: spec;
				bootstrap: spec;
				heimdall: spec;
				voyage: spec;
				mocketry: spec.
			spec
				package: 'OOnoz-Model' with: [ spec requires: #('Voyage') ];
				package: 'OOnoz-Model-Statistics' with: [ spec requires: #('OOnoz-Model') ];
				package: 'OOnoz-Tests-Model' with: [ spec requires: #('OOnoz-Model' 'Mocketry') ];
				package: 'OOnoz-Tests-Model-Statistics' with: [ spec requires: #('OOnoz-Model-Statistics' 'Mocketry') ];
				package: 'OOnoz-Server';
				package: 'OOnoz-WebApplication'
					with: [ spec requires: #('Heimdall' 'Seaside3' 'OOnoz-Model' 'OOnoz-Model-Statistics' 'OOnoz-Server' 'Bootstrap') ];
				package: 'OOnoz-Development' with: [ spec requires: #('Model' 'Tests' 'UI') ].
			spec
				group: 'Model' with: #('OOnoz-Model' 'OOnoz-Model-Statistics');
				group: 'Tests' with: #('OOnoz-Tests-Model' 'OOnoz-Tests-Model-Statistics');
				group: 'UI' with: #('OOnoz-WebApplication');
				group: 'Development' with: #('OOnoz-Development') ]