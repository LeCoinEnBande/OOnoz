baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ self
				seaside3: spec;
				mdl: spec.
			spec
				package: 'OOnoze-Model';
				package: 'OOnoze-Test-Model' with: [ spec requires: #('OOnoze-Model') ].
			spec
				group: 'Tests' with: #('OOnoze-Test-Model');
				group: 'Model' with: #('OOnoze-Model')	";
				group: 'UI' with: #('') " ]