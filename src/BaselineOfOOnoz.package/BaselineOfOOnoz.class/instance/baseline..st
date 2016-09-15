baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ self
				seaside3: spec;
				mdl: spec.
			spec
				package: 'OOnoz-Model';
				package: 'OOnoz-Tests-Model' with: [ spec requires: #('OOnoz-Model') ].
			spec
				group: 'Tests' with: #('OOnoz-Tests-Model');
				group: 'Model' with: #('OOnoz-Model')	";
				group: 'UI' with: #('') " ]