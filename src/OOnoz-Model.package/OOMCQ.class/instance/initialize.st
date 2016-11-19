initialization
initialize
	super initialize.
	self questions: Set new.
	self defaultOrderer.
	self markingScheme: OOStrictWithPenalityScheme