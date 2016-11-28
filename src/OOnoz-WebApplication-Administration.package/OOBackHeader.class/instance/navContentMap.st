accessing
navContentMap
	self flag: #todo.	"Check if the user is admin or not to restain pages."
	^ OrderedDictionary new
		add: 'Dashboard' -> OODashboardPage;
		add: 'Communautés' -> OOThemePage;
		add: 'Questionnaires' -> OOQuestionnairePage;
		add: 'Livraisons' -> OOShippingPage;
		add: 'Statistiques' -> OOStatisticsPage;
		add: 'Utilisateurs' -> OOUserManagementPage;
		add: self currentUser displayName -> OOProfilePage;
		yourself