accessing
state
	^ state ifNil: [ state := #active ]