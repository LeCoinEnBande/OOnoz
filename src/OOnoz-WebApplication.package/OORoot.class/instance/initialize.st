initialization
initialize
	super initialize.
	self session rootComponent: self.
	self header: self defaultHeader.
	self footer: self defaultFooter