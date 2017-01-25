initialization
initialize
	super initialize.
	self mcqs: OrderedCollection new.
	self hasAvatar: false.
	self beOtherGender.
	self desactivate.
	self role: OOPlayerRole