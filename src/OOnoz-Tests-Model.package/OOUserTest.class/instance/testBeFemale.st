tests
testBeFemale
	user beOtherGender.
	self deny: user gender = #female.
	user beFemale.
	self assert: user gender equals: #female