initialization
initialize
	super initialize.
	self timeByQuestion: (Duration seconds: 90).
	self gift: OONilGift new