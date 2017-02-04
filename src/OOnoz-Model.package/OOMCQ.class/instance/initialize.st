initialization
initialize
	super initialize.
	self questions: Set new.
	self defaultOrderer.
	self price: 0.
	self markingScheme: OOStrictWithPenalityScheme.
	self resetSubThemes.
	self isActivated: true.
	self level: 1.
	self state: #inactive