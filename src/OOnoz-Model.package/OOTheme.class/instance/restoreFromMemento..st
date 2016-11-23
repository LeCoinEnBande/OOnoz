memento
restoreFromMemento: aMemento
	super restoreFromMemento: aMemento.
	self subThemes: OrderedCollection new.
	aMemento subThemes do: [ :s | self addSubTheme: s ]