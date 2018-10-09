Extension { #name : #Dictionary }

{ #category : #'*OOnoz-Model-Statistics' }
Dictionary >> at: aKey ifPresentPut: aValue ifAbsent: anErrorBlock [
	self at: aKey ifPresent: [ :i | self at: aKey put: aValue ] ifAbsent: [ anErrorBlock value ]
]
