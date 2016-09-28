baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ self
				seaside3: spec;
				mdl: spec;
				heimdall: spec;
				voyage: spec;
				mocketry: spec.
			spec
				package: 'OOnoz-Model' with: [ spec requires: #('Voyage') ];
				package: 'OOnoz-Tests-Model' with: [ spec requires: #('OOnoz-Model' 'Mocketry') ];
				package: 'OOnoz-Server';
				package: 'OOnoz-WebApplication' with: [ spec requires: #('Heimdall' 'Seaside3' 'OOnoz-Model' 'OOnoz-Server' 'MaterialDesignLite') ];
				package: 'OOnoz-Development' with: [ spec requires: #('Model' 'Tests' 'UI') ].
			spec
				group: 'Tests' with: #('OOnoz-Tests-Model');
				group: 'Model' with: #('OOnoz-Model');
				group: 'UI' with: #('OOnoz-WebApplication');
				group: 'Development' with: #('OOnoz-Development') ]