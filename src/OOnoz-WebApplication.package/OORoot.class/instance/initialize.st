initialization
initialize
	super initialize.
	self session rootComponent: self.
	self componentsInstances: Dictionary new.
	self displayDefaultScreen.
	self header: self defaultHeader.
	self footer: self defaultFooter