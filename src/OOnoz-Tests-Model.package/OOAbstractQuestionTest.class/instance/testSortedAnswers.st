tests
testSortedAnswers
	| answers |
	question answers: (self generateAnswersUpTo: 10 rights: 2).
	answers := question sortedAnswers.
	1 to: 10 do: [ :i | self assert: (answers at: i) index equals: i ]