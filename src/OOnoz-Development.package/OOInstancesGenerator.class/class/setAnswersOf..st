helpers
setAnswersOf: question
	| numberOfAnswers |
	numberOfAnswers := (question questionClass minimumNumberOfAnswers to: question questionClass maximumNumberOfAnswers) atRandom.
	question
		answers: (self generateAnswersUpTo: numberOfAnswers rights: (question questionClass minNumberOfRightAnswers to: (question questionClass maxNumberOfRightAnswers min: numberOfAnswers - 1)) atRandom)