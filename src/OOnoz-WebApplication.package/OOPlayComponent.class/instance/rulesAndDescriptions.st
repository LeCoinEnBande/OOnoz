accessing
rulesAndDescriptions
	^ OrderedDictionary
		with: self mcq markingScheme label -> self mcq markingScheme description
		with: 'E-Learning' -> 'Ce questionnaire est a but éducatif. Il n''y aura pas de temps limite pour répondre aux questions.'
		with: 'Sans cadeau' -> 'Ce questionnaire n''offre pas de cadeau pour lors de sa réussite.'