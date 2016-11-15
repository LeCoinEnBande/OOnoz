instance creation
newInstance
	^ self actualClass new
		finished;
		dateBegin:
			(DateAndTime
				year: 2016
				month: 10
				day: 26
				hour: 16
				minute: 18
				second: 0);
		dateEnd:
			(DateAndTime
				year: 2016
				month: 10
				day: 26
				hour: 17
				minute: 38
				second: 30);
		yourself