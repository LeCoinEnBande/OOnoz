memento
restoreFromMemento: aMemento
	super restoreFromMemento: aMemento.
	self theme: aMemento theme.
	(self theme subThemes includes: self)
		ifFalse: [ self theme addSubTheme: self ]