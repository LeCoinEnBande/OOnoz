tests
testDuration
	self
		assert: result duration
		equals:
			(Duration
				days: 0
				hours: 1
				minutes: 20
				seconds: 30)