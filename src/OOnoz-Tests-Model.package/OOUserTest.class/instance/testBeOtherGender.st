tests
testBeOtherGender
	user beMale.
	self deny: user gender = #other.
	user beOtherGender.
	self assert: user gender equals: #other