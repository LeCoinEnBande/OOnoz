tests
testBeMale
	user beOtherGender.
	self deny: user gender = #male.
	user beMale.
	self assert: user gender equals: #male