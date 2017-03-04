tests
testInvalidate
	self should: [ instance invalidate: 'aMessage' ] raise: OOError