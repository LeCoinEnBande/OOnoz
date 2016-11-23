development support
validate
	super validate.
	self theme ifNil: [ self invalidate: 'Un sous thème devrabit avoir un thème.' ]