Extension { #name : #String }

{ #category : #'*OOnoz-WebApplication-Core' }
String >> displayContractedTo: anInteger [
	self size <= anInteger
		ifTrue: [ ^ self ].
	^ self copyReplaceFrom: anInteger to: self size with: '...'
]

{ #category : #'*OOnoz-WebApplication-Core' }
String >> js [
	^ JSStream on: self
]
