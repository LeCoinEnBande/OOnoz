initialization
initialize
	super initialize.
	self
		mcqFilter:
			((OOMCQFilter refreshScript: [ :html | 'location.reload()' js ])
				shouldDisplayState: false;
				yourself)