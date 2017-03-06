helpers
generateNewBirthdayDate
	^ Date
		year: (1960 to: 2000) atRandom
		month: (01 to: 12) atRandom
		day: (01 to: 28) atRandom