action
headerClickAction
	self isActive ifTrue: [ ^ self ].
	
	self owner questions
		detect: #isActive
		ifFound: [ :q | 
			q desactivate.
			self activate ]