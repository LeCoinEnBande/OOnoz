action
sendSubscriptionEmail
	self flag: #todo.
	self emailUtils sendEmailTo: self user mail subject: 'Inscription à OOnoz' htmlBody: '<html><body>TODO</body></html>'