accessing
navContentMap
	self flag: #todo. "clean"
	^ OrderedDictionary
		with: 'Dashboard' -> OOReceptionComponent
		with: 'Communautés' -> OOTestComponent
		with: 'Questionnaires' -> OOQuestionnairePage
		with: 'Statistiques' -> OOTestComponent
		with:
			(String
				streamContents: [ :s | 
					s
						<< (self currentUser firstName ifNil: [ 'Tony' ]);
						<< ' ';
						<< (self currentUser lastName ifNil: [ 'Montana' ]) ]) -> OOProfilPage