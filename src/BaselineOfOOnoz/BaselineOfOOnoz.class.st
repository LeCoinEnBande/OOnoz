Class {
	#name : #BaselineOfOOnoz,
	#superclass : #BaselineOf,
	#category : #BaselineOfOOnoz
}

{ #category : #baseline }
BaselineOfOOnoz >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec postLoadDoIt: #hackForMetacelloBug.

			"Dependencies"
			self
				bootstrap: spec;
				voyage: spec;
				chartJs: spec;
				mocketry: spec;
				spec: spec.

			"Packages"
			spec
				package: 'OOnoz-Model' with: [ spec requires: #('Voyage') ];
				package: 'OOnoz-Model-Statistics' with: [ spec requires: #('OOnoz-Model') ];
				package: 'OOnoz-Tests-Model' with: [ spec requires: #('OOnoz-Model' 'Mocketry') ];
				package: 'OOnoz-Tests-Model-Statistics' with: [ spec requires: #('OOnoz-Model-Statistics' 'Mocketry') ];
				package: 'OOnoz-Server';
				package: 'OOnoz-WebApplication-Core' with: [ spec requires: #('OOnoz-Model' 'OOnoz-Model-Statistics' 'OOnoz-Server' 'Bootstrap') ];
				package: 'OOnoz-WebApplication-Administration' with: [ spec requires: #('OOnoz-WebApplication-Core' 'ChartJs') ];
				package: 'OOnoz-WebApplication-Front' with: [ spec requires: #('OOnoz-WebApplication-Core') ];
				package: 'OOnoz-Development' with: [ spec requires: #('Model' 'Tests' 'UI' 'Spec') ].

			"Groups"
			spec
				group: 'Model' with: #('OOnoz-Model' 'OOnoz-Model-Statistics');
				group: 'Tests' with: #('OOnoz-Tests-Model' 'OOnoz-Tests-Model-Statistics');
				group: 'UI' with: #('OOnoz-WebApplication-Core' 'OOnoz-WebApplication-Front' 'OOnoz-WebApplication-Administration');
				group: 'Development' with: #('OOnoz-Development') ]
]

{ #category : #dependencies }
BaselineOfOOnoz >> bootstrap: spec [
	spec baseline: 'Bootstrap' with: [ spec repository: 'github://jecisc/Seaside-Bootstrap/src' ]
]

{ #category : #dependencies }
BaselineOfOOnoz >> chartJs: spec [
	spec
		baseline: 'ChartJs'
		with: [ spec
				loads: #('core');
				repository: 'github://DuneSt/chartJs:v1.x.x/src' ]
]

{ #category : #hack }
BaselineOfOOnoz >> hackForMetacelloBug [
	"There is a bug in Metacello and it load the Cryptography from StHub :( For now I'll use a hack to reload the right one."
	
	Metacello new
		baseline:'Cryptography';
		repository: 'github://zweidenker/Cryptography:0.3.1/source';
		onConflict: [ :e | e useIncoming ];
		load: 'core'
]

{ #category : #dependencies }
BaselineOfOOnoz >> mocketry: spec [
	spec baseline: 'Mocketry' with: [ spec repository: 'github://dionisiydk/Mocketry:v4.0.x' ]
]

{ #category : #accessing }
BaselineOfOOnoz >> projectClass [
	^ [ self class environment at: #MetacelloCypressBaselineProject ]
		on: NotFound
		do: [ super projectClass ]

]

{ #category : #dependencies }
BaselineOfOOnoz >> spec: spec [
	spec baseline: 'Spec' with: [ spec repository: 'github://pharo-spec/Spec/src' ]
]

{ #category : #dependencies }
BaselineOfOOnoz >> voyage: spec [
	"Persistance manager"

	spec
		baseline: 'Voyage'
		with: [ spec
				repository: 'github://pharo-nosql/voyage:master/mc';
				loads: #('mongo' 'memory') ]
]
