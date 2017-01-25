initialization
initialize
	super initialize.
	self changePasswordComponent: OOChangePasswordnComponent new.
	self user: self currentUser