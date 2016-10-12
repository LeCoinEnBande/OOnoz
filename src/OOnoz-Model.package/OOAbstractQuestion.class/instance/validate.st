validation
validate
	(self description isNil
		or: [ self answers size < self class minimumNumberOfAnswers
				or: [ self answers size > self class maximumNumberOfAnswers
						or: [ (self answers select: #isRight) size < self class minNumberOfRightAnswers
								or: [ (self answers select: #isRight) size > self class maxNumberOfRightAnswers ] ] ] ])
		ifTrue: [ (OOInvalidQuestion question: self) signal ]