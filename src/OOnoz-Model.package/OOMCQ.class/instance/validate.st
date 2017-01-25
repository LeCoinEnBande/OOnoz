validate
validate
	self validateMCQ.
	self questions do: [ :each | each validate ]