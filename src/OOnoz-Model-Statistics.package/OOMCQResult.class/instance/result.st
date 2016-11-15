accessing
result
	self isFinished ifFalse: [ self raiseNotFinishException ].
	
	^ (self questionResults collect: #result) sum