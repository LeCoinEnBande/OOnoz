tests
testFinishAndSetEndTime
	| begin |
	begin := DateAndTime now.
	result notFinished.
	result finishAndSetEndTime.
	self assert: result isFinished.
	self assert: (result dateEnd between: begin and: DateAndTime now)