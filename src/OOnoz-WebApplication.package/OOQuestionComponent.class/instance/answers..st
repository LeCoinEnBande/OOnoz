accessing
answers: aCollection
	self flag: #clean.	"Before we setted the useranswers only when we clicked. Now we do it when we do it here to help with the ajax management. Check the rest of the class because it is possible that we can clean some code."
	answers := aCollection.
	aCollection do: [ :each | self userAnswers at: each put: false ]