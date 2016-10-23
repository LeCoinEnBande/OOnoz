hook
cancel
	self mcq restoreFromMomento: self momento.
	self questionComponents do: #reset.
	super cancel