action
save
	self currentApp addTheme: self theme.
	self theme save.
	self currentApp save.
	self answer: true
	