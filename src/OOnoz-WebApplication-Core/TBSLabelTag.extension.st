Extension { #name : #TBSLabelTag }

{ #category : #'*OOnoz-WebApplication-Core' }
TBSLabelTag >> beDangerIf: aBoolean [
	aBoolean
		ifTrue: [ self beDanger ]
]

{ #category : #'*OOnoz-WebApplication-Core' }
TBSLabelTag >> beSuccessIf: aBoolean [
	aBoolean
		ifTrue: [ self beSuccess ]
]
