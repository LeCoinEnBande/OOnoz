initialization
initialize
	super initialize.
	self session rootComponent: self.
	self initScreens.
	self header: self defaultHeader