tests
testEquals
	| instance2 |
	super testEquals.
	instance2 := self newMCQInstance
		gift: (OOGift description: 'test');
		yourself.
	self deny: mcq = instance2 description: 'The two intances should not be equal because the second is different.'