rendering
renderContentOn: html
	html
		tbsContainer: [ html tbsRow
				class: 'bs-wizard';
				with: [ (OrderedDictionary with: 1 -> 'Choix du thème' with: 2 -> 'Choix du sous-thème' with: 3 -> 'Choix du questionnaire')
						keysAndValuesDo: [ :currentStep :label | self renderProgressBarFor: currentStep with: label on: html ] ] ].
	self renderSearchFieldOn: html.
	html tbsContainer
		id: 'queryResult';
		attributeAt: 'data-columns' put: '';
		with: [ self entitiesToShow do: [ :entity | entity renderForSearchOn: html ] ]