initialization
initialize
	super initialize.
	self memento: self currentUser createMemento.
	self changePasswordComponent: OOChangePasswordnComponent new