Extension { #name : #OOAdminRole }

{ #category : #'*OOnoz-WebApplication-Administration' }
OOAdminRole class >> administrationMap [
	^ super administrationMap
		add: 'Communautés' -> OOThemePage;
		add: 'Utilisateurs' -> OOUserManagementPage;
		yourself
]

{ #category : #'*OOnoz-WebApplication-Administration' }
OOAdminRole class >> mcqsEditableBy: anUser [
	^ OOAbstractMCQ selectAll
]
