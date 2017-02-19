*OOnoz-WebApplication-Core
displayContractedTo: anInteger
	self size <= anInteger
		ifTrue: [ ^ self ].
	^ self copyReplaceFrom: anInteger to: self size with: '...'