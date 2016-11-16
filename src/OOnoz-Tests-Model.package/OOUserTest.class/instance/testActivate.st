tests
testActivate
	user desactivate.
	self deny: user isActivated.
	user activate.
	self assert: user isActivated