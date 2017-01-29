accessing
computeEntitiesToShow
	^ self inputEntities
		select:
			[ :entity | OOPseudoRegexFilter isMatching: entity title with: self filter ]