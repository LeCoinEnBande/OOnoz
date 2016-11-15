hook
cancel
	self mcq restoreFromMemento: self memento.
	self questionComponents do: #reset.
	super cancel