action
sendNewPassword
	self user isLoggable
		ifTrue: [ | newPass |
			newPass := self randomPassword.
			self user password: newPass.
			self user save.
			self emailUtils
				sendEmailTo: self user mail
				subject: 'Nouveau mot de passe'
				htmlBody:
					(String
						streamContents: [ :s | 
							s
								<< '<html><body>';
								<< newPass;
								<< '</body></html>' ]).
			self displayDefaultScreen ]
		ifFalse: [ self hasBeenValidated: true ]