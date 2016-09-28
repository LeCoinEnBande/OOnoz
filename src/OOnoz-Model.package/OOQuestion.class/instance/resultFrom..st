result
resultFrom: aDictionary
	"The result is the frequence of good answers."

	aDictionary size = self answers size
		ifFalse: [ SizeMismatch signal ].
	aDictionary keys asSet = self answers
		ifFalse: [ (OOAnswerDoesNotMatch answer: (aDictionary keys asSet \ self answers) anyOne) signal ].
	^ 1 / self answers size * (aDictionary associations inject: 0 into: [ :res :asso | asso key isRight = asso value ifTrue: [ res + 1 ] ifFalse: [ res ] ])