initialization
initialize
	super initialize.
	self notFinished.
	self questionResults: OrderedCollection new.
	self dateBegin: DateAndTime now