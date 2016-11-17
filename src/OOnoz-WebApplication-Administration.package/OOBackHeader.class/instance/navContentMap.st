accessing
navContentMap
	self flag: #todo.	"Check if the user is admin or not to restain pages."
	^ OrderedDictionary
		with: 'Dashboard' -> OODashboardPage
		with: 'Communautés' -> OOThemePage
		with: 'Questionnaires' -> OOQuestionnairePage
		with: 'Statistiques' -> OOStatisticsPage
		with: 'Utilisateurs' -> OOUserManagementPage
		with: self currentUser displayName -> OOProfilePage