validation
validate
	self description isNil
		ifTrue: [ (OOInvalidQuestion question: self) signal ].
	"le nombre d answers ne doit pas etre inférieur au nombre minimum de réponses"
	self answers size < self class minimumNumberOfAnswers
		ifTrue: [ (OOInvalidQuestion question: self) signal ].
	"le nombre d answers ne doit pas etre supérieur au nombre maximum de réponses"
	self answers size > self class maximumNumberOfAnswers
		ifTrue: [ (OOInvalidQuestion question: self) signal ].
	"le nombre de bonnes answers ne doit pas etre inférieur au nombre minimum de bonnes réponses"
	(self answers select: #isRight) size < self class minNumberOfRightAnswers
		ifTrue: [ (OOInvalidQuestion question: self) signal ].
	"le nombre de bonnes answers ne doit pas etre supérieur au nombre maximum de bonnes réponses"
	(self answers select: #isRight) size > self class maxNumberOfRightAnswers
		ifTrue: [ (OOInvalidQuestion question: self) signal ]