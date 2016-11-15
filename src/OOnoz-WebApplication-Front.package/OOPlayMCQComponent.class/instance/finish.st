action
finish
	self questions do: #desactivate.	"Ensure last question played is correctly set in statistics."
	self result finishAndSetEndTime.
	self result save.
	self answer: (self call: (OOResultPageComponent result: self result))