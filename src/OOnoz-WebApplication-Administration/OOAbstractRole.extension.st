Extension { #name : #OOAbstractRole }

{ #category : #'*OOnoz-WebApplication-Administration' }
OOAbstractRole class >> administrationMap [
	^ OrderedDictionary new
		add: 'Statistiques' -> OOStatisticsPage;
		add: 'Questionnaires' -> OOQuestionnairePage;
		add: 'Livraisons' -> OOShippingPage;
		yourself
]

{ #category : #'*OOnoz-WebApplication-Administration' }
OOAbstractRole class >> mcqsEditableBy: anUser [ 
	^ anUser mcqs
]
