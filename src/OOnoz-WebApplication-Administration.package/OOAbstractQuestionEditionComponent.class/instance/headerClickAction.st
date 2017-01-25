action
headerClickAction
	self isActive ifTrue: [ ^ self ].
	
	self owner questionComponents detect: #isActive ifFound: [ :q | q desactivate ].
	self activate