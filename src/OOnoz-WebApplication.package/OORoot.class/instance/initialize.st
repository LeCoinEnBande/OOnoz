initialization
initialize
	super initialize.
	self session rootComponent: self.
	self componentsInstances: Dictionary new.
	self setInstanceOf: OOTestComponent.
	self header: self defaultHeader.
	self footer: self defaultFooter