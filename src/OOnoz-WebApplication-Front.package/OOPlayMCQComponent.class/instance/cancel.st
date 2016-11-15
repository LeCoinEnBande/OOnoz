action
cancel
	self questions do: #desactivate.	"Ensure last question played is correctly set in statistics."
	self result save.
	self answer: false