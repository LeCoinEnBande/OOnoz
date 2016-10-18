helpers
validAssociation
	"I return an association. The key is a number of answer valid for this kind of question. The value is the number of right aswers needed to be valid."

	^ self actualClass minimumNumberOfAnswers -> self rightNumberOfAnswers