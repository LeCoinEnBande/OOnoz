tests
testDesactivate
	user activate.
	self assert: user isActivated.
	user desactivate.
	self deny: user isActivated