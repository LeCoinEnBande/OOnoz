accessing
duration
	(self dateBegin isNil or: [ self dateEnd isNil or: [ self dateBegin > self dateEnd ] ])
		ifTrue: [ OOError signal: 'Wrong dates' ].
		
	^ (self dateEnd - self dateBegin) asDuration