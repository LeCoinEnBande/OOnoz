memento
restoreFromMemento: aMemento
	"I am used for the memento pattern. My goal is to set my state to the set of the memento.
	I let the questions manage their own memento."

	self firstName: aMemento firstName.
	self lastName: aMemento lastName.
	self mail: aMemento mail.
	self isActivated: aMemento isActivated.
	self birthday: aMemento birthday.
	self gender: aMemento gender