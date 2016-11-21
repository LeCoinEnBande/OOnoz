accessing
rulesAndDescriptions
	^ OrderedDictionary
		with: self mcq markingScheme label -> self mcq markingScheme description
		with: self mcq class kind -> self mcq class kindDescription
		with: self mcq gift label -> self mcq gift labelDescription