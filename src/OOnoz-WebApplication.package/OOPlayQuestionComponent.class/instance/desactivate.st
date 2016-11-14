action
desactivate
	self isActive: false.
	self timeOfActivation
		ifNotNil: [ :date | 
			self result addToDuration: (DateAndTime now - date) asDuration.
			self timeOfActivation: nil ]