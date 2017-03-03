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
				htmlBody: ((self emailTemplate copyReplaceAll: '{{{PASSWORD}}}' with: newPass) copyReplaceAll: '{{{USERNAME}}}' with: self user displayName).
			self returnToLogin ]
		ifFalse: [ self hasBeenValidated: true ]