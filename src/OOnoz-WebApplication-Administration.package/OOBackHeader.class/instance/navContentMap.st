accessing
navContentMap
	^ OrderedDictionary
		with: 'Dashboard' -> OOReceptionComponent
		with: 'Communautés' -> OOThemePage
		with: 'Questionnaires' -> OOQuestionnairePage
		with: 'Statistiques' -> OOPlayComponent
		with:
			(String
				streamContents: [ :s | 
					s
						<< (self currentUser firstName ifNil: [ 'Tony' ]);
						<< ' ';
						<< (self currentUser lastName ifNil: [ 'Montana' ]) ]) -> OOProfilePage