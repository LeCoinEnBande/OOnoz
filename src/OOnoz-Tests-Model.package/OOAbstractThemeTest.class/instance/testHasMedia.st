tests
testHasMedia
	instance mediaLink: nil.
	self deny: instance hasMedia.
	instance mediaLink: 'anURL'.
	self assert: instance hasMedia