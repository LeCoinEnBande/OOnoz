initialization
initialize
	super initialize.
	self questions: Set new.
	self defaultOrderer.
	self markingScheme: OOStrictWithPenalityScheme.
	self resetSubThemes.
	self level: 1.
	self state: #inactive