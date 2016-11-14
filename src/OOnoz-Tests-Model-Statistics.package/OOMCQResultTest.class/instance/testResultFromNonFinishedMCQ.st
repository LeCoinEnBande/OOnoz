tests
testResultFromNonFinishedMCQ
	result notFinished.
	self should: [ result result ] raise: OOMCQNotFinished