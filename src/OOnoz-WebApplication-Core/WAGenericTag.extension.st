Extension { #name : #WAGenericTag }

{ #category : #'*OOnoz-WebApplication-Core' }
WAGenericTag >> beDanger [
	self class: #'badge-danger'
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAGenericTag >> beDangerIf: aBoolean [
	aBoolean ifTrue: [ self beDanger ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAGenericTag >> beSuccess [
	self class: #'badge-success'
]

{ #category : #'*OOnoz-WebApplication-Core' }
WAGenericTag >> beSuccessIf: aBoolean [
	aBoolean ifTrue: [ self beSuccess ]
]
